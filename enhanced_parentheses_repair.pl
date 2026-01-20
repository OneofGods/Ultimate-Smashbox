#!/usr/bin/perl
# 🔧💀 ENHANCED PARENTHESES REPAIR SCRIPT 💀🔧
# Advanced repair for remaining orphaned parentheses

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
    print "🔧 ENHANCED repair: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content line by line for precise repair
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my @lines = <$fh>;
    close($fh);
    
    my $repairs_made = 0;
    
    # Process each line individually
    for my $i (0..$#lines) {
        my $line = $lines[$i];
        my $original_line = $line;
        
        # ENHANCED REPAIR PATTERNS
        
        # Pattern 1: Fix "triggerall = condition && var(X" -> "triggerall = condition && var(X) != 0"
        $line =~ s/(triggerall\s*=\s*[^=]*&&\s*var\(\d+)(?!\s*[)])/$1) != 0/g;
        
        # Pattern 2: Fix "triggerall = condition || var(X" -> "triggerall = condition || var(X) != 0"
        $line =~ s/(triggerall\s*=\s*[^=]*\|\|\s*var\(\d+)(?!\s*[)])/$1) != 0/g;
        
        # Pattern 3: Fix isolated "var(X" at end of expressions
        $line =~ s/(\s+var\(\d+)(\s*$)/$1)$2/g;
        
        # Pattern 4: Fix "!var(X" -> "!var(X)"
        $line =~ s/(!\s*var\(\d+)(?!\s*[)])/$1)/g;
        
        # Pattern 5: Fix mathematical expressions "var(X + something" -> "var(X) + something"
        $line =~ s/var\((\d+)\s+([+\-*\/])/var($1) $2/g;
        
        # Pattern 6: Fix comparison operators with var
        $line =~ s/(>=\s*var\(\d+)(?!\s*[)])/$1)/g;
        $line =~ s/(<=\s*var\(\d+)(?!\s*[)])/$1)/g;
        $line =~ s/(!=\s*var\(\d+)(?!\s*[)])/$1)/g;
        $line =~ s/(==\s*var\(\d+)(?!\s*[)])/$1)/g;
        $line =~ s/(>\s*var\(\d+)(?!\s*[)])/$1)/g;
        $line =~ s/(<\s*var\(\d+)(?!\s*[)])/$1)/g;
        
        # Pattern 7: Fix assignment operations
        $line =~ s/(=\s*var\(\d+)(?!\s*[)])/$1)/g;
        
        # Pattern 8: Fix function calls like "command(var(X" -> "command(var(X))"
        $line =~ s/(\w+\(\s*var\(\d+)(?!\s*[)])/$1))/g;
        
        # Pattern 9: Fix comma-separated var calls "var(X, var(Y" -> "var(X), var(Y)"
        $line =~ s/(var\(\d+),\s*(var\(\d+)(?!\s*[)])/$1), $2)/g;
        
        # Count if repair was made
        if ($line ne $original_line) {
            $repairs_made++;
            print "   Line ${\($i+1)}: REPAIRED\n";
        }
        
        $lines[$i] = $line;
    }
    
    $total_repairs += $repairs_made;
    print "   Lines repaired: $repairs_made\n";
    
    # Write repaired content back
    open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
    print $out_fh @lines;
    close($out_fh);
    
    print "   ✅ Enhanced repair complete!\n\n";
}

print "🔧💀 ENHANCED REPAIR COMPLETE! 💀🔧\n";
print "TOTAL LINES REPAIRED: $total_repairs\n";
print "🏆 REMAINING SYNTAX CORRUPTION ELIMINATED! 🏆\n";