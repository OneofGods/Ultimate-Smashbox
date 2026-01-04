#!/usr/bin/perl
# 🔧💀 ORPHANED PARENTHESES REPAIR SCRIPT 💀🔧
# Mass repair of unclosed parentheses caused by demon elimination

use strict;
use warnings;

my $total_repairs = 0;
my @files_to_repair = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisystem.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morispecial.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisuper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morihelper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/moridarkforce.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morinormal.st'
);

foreach my $file (@files_to_repair) {
    print "🔧 Repairing ORPHANED parentheses: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $content = do { local $/; <$fh> };
    close($fh);
    
    # Count orphaned patterns before repair
    my $original_orphans = 0;
    $original_orphans += () = $content =~ /\|\|\s*var\(\d+(?![)])/g;
    $original_orphans += () = $content =~ /&&\s*var\(\d+(?![)])/g;
    $original_orphans += () = $content =~ /=\s*var\(\d+(?![)])/g;
    $original_orphans += () = $content =~ />\s*var\(\d+(?![)])/g;
    $original_orphans += () = $content =~ /<\s*var\(\d+(?![)])/g;
    $original_orphans += () = $content =~ /!=\s*var\(\d+(?![)])/g;
    $original_orphans += () = $content =~ /==\s*var\(\d+(?![)])/g;
    $original_orphans += () = $content =~ /time\s*>\s*\d+\s*\|\|\s*var\(\d+(?![)])/g;
    
    print "   Original orphaned parentheses: $original_orphans\n";
    
    # REPAIR STRATEGY 1: Fix common var() patterns
    # || var(X -> || var(X) != 0
    $content =~ s/(\|\|\s*var\(\d+)(?!\))/$1) != 0/g;
    
    # && var(X -> && var(X) != 0  
    $content =~ s/(&&\s*var\(\d+)(?!\))/$1) != 0/g;
    
    # = var(X -> = var(X)
    $content =~ s/(=\s*var\(\d+)(?!\))/$1)/g;
    
    # > var(X -> > var(X)
    $content =~ s/(>\s*var\(\d+)(?!\))/$1)/g;
    
    # < var(X -> < var(X)
    $content =~ s/(<\s*var\(\d+)(?!\))/$1)/g;
    
    # != var(X -> != var(X)
    $content =~ s/(!=\s*var\(\d+)(?!\))/$1)/g;
    
    # == var(X -> == var(X)
    $content =~ s/(==\s*var\(\d+)(?!\))/$1)/g;
    
    # REPAIR STRATEGY 2: Fix complex expressions like "time > 10 || var(0"
    $content =~ s/(time\s*>\s*\d+\s*\|\|\s*var\(\d+)(?!\))/$1) != 0/g;
    
    # REPAIR STRATEGY 3: Fix math expressions with orphaned parentheses
    # Fix patterns like "var(62 + ((random % 9)))" -> "var(62) + ((random % 9))"
    $content =~ s/var\((\d+)\s+\+\s+/var($1) + /g;
    $content =~ s/var\((\d+)\s+\-\s+/var($1) - /g;
    $content =~ s/var\((\d+)\s+\*\s+/var($1) * /g;
    $content =~ s/var\((\d+)\s+\/\s+/var($1) \/ /g;
    
    # REPAIR STRATEGY 4: Fix orphaned function calls
    # Handle cases where closing parenthesis was accidentally removed
    $content =~ s/(\w+\([^)]*[^)])(\s*[=<>!&|,\n\r])/if(index($1, ')') == -1) { "$1)$2" } else { "$1$2" }/ge;
    
    # Count remaining orphaned patterns
    my $remaining_orphans = 0;
    $remaining_orphans += () = $content =~ /\|\|\s*var\(\d+(?![)])/g;
    $remaining_orphans += () = $content =~ /&&\s*var\(\d+(?![)])/g;
    $remaining_orphans += () = $content =~ /=\s*var\(\d+(?![)])/g;
    $remaining_orphans += () = $content =~ />\s*var\(\d+(?![)])/g;
    $remaining_orphans += () = $content =~ /<\s*var\(\d+(?![)])/g;
    $remaining_orphans += () = $content =~ /!=\s*var\(\d+(?![)])/g;
    $remaining_orphans += () = $content =~ /==\s*var\(\d+(?![)])/g;
    
    my $repairs_made = $original_orphans - $remaining_orphans;
    $total_repairs += $repairs_made;
    
    print "   Parentheses repaired: $repairs_made\n";
    print "   Orphaned patterns remaining: $remaining_orphans\n";
    
    # Write repaired content back
    open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
    print $out_fh $content;
    close($out_fh);
    
    print "   ✅ File repaired!\n\n";
}

print "🔧💀 PARENTHESES REPAIR COMPLETE! 💀🔧\n";
print "TOTAL PARENTHESES REPAIRED: $total_repairs\n";
print "🏆 SYNTAX CORRUPTION ELIMINATED! 🏆\n";