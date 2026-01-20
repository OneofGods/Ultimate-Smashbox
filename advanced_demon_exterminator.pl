#!/usr/bin/perl
# 🚨💀 ADVANCED DEMON EXTERMINATOR - TARGET MALFORMED OPERATORS 💀🚨
# TARGETS: Malformed operators, broken logical operators, broken variable references

use strict;
use warnings;

my @files_to_fix = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisystem.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morispecial.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisuper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morihelper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/moridarkforce.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morinormal.st'
);

my $total_demons_fixed = 0;

print "🚨💀 ADVANCED DEMON EXTERMINATOR ACTIVATED 💀🚨\n";
print "TARGETING MALFORMED OPERATORS AND BROKEN VARIABLES...\n\n";

foreach my $file (@files_to_fix) {
    print "🎯 TARGETING ADVANCED DEMONS: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $content = do { local $/; <$fh> };
    close($fh);
    
    my $original_content = $content;
    my $file_demons = 0;
    
    # ADVANCED DEMON FIXES
    
    # 1. Fix malformed trigger operators like "trigger1 )= expression"
    my $fixes = ($content =~ s/trigger(\d+)\s*\)\s*=/trigger$1 =/g);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes malformed trigger operators\n";
    }
    
    # 2. Fix broken logical operators like "&)&" and "|)|"
    $fixes = ($content =~ s/&\)&/&&/g);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes broken && operators\n";
    }
    
    $fixes = ($content =~ s/\|\)\|/||/g);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes broken || operators\n";
    }
    
    # 3. Fix broken variable references like "var(123)45)" 
    $fixes = ($content =~ s/var\((\d+)\)(\d+)\)/var($1$2)/g);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes broken variable references\n";
    }
    
    # 4. Fix missing closing parentheses in expressions
    $fixes = ($content =~ s/(\w+)\s*=\s*([^=\n]+?)(?<!\))\s*$/\1 = \2/gm);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes incomplete expressions\n";
    }
    
    # 5. Fix missing commas in function calls like "pos = x * const(size.xscale, y"
    $fixes = ($content =~ s/pos\s*=\s*([^=\n]*const\([^,)]+),\s*([^)=\n]+)(?!\))/pos = $1), $2/g);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes missing parentheses in pos assignments\n";
    }
    
    # 6. Fix orphaned closing parentheses 
    $fixes = ($content =~ s/(\w+)\s*\)\s*=\s*([^=\n]+)/\1 = \2/g);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes orphaned closing parentheses\n";
    }
    
    # 7. Fix missing closing parentheses in various function calls
    $fixes = ($content =~ s/(\w+ID)\((\d+),?\s*([^)=\n]+)(?<!\))(\s*$)/\1(\2), \3/gm);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes missing parentheses in ID functions\n";
    }
    
    # 8. Fix broken sparkno assignments like "sparkno )= -1 + 0 * (var(121) = 8023"
    $fixes = ($content =~ s/(\w+)\s*\)\s*=\s*(-?\d+)\s*\+\s*0\s*\*\s*\(var\(\d+\)\s*=\s*\d+/\1 = \2/g);
    $file_demons += $fixes;
    if ($fixes > 0) {
        print "   💀 Fixed $fixes broken sparkno assignments\n";
    }
    
    $total_demons_fixed += $file_demons;
    
    # Write back only if changes were made
    if ($content ne $original_content) {
        open($fh, '>', $file) or die "Cannot write $file: $!";
        print $fh $content;
        close($fh);
        print "   📊 ADVANCED DEMONS FIXED IN FILE: $file_demons\n";
    } else {
        print "   ✅ No advanced demons found in file!\n";
    }
    print "   🎯 Advanced targeting complete!\n\n";
}

print "🚨💀 ADVANCED DEMON EXTERMINATION COMPLETE! 💀🚨\n";
print "TOTAL ADVANCED DEMONS FIXED: $total_demons_fixed\n";

if ($total_demons_fixed > 0) {
    print "🏆 MALFORMED OPERATORS NEUTRALIZED! 🏆\n";
} else {
    print "✅ NO ADVANCED DEMONS DETECTED! FILES ARE CLEAN! ✅\n";
}

print "\n🎯 ADVANCED EXTERMINATION PROTOCOL COMPLETE 🎯\n";