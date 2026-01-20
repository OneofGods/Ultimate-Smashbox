#!/usr/bin/perl
# 🚨💀 COMPREHENSIVE VALUE ASSIGNMENT DEMON HUNTER 💀🚨
# Mass extermination of varset controllers with corrupted value assignments

use strict;
use warnings;

my $total_value_demons = 0;
my @files_to_purify = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisystem.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morispecial.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisuper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morihelper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/moridarkforce.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morinormal.st'
);

print "🚨💀 VALUE ASSIGNMENT DEMON HUNTING PROTOCOL ACTIVATED 💀🚨\n";
print "TARGETING VARSET CONTROLLER VALUE CORRUPTION...\n\n";

foreach my $file (@files_to_purify) {
    print "🔍 SCANNING FOR VALUE DEMONS: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content line by line for precise detection
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my @lines = <$fh>;
    close($fh);
    
    my $file_demons = 0;
    my $in_varset = 0;
    my $varset_start_line = 0;
    
    for my $i (0..$#lines) {
        my $line = $lines[$i];
        chomp $line;
        
        # Detect start of varset controller
        if ($line =~ /type\s*=\s*varset/i) {
            $in_varset = 1;
            $varset_start_line = $i;
            next;
        }
        
        # Detect start of new state controller (exit varset)
        if ($in_varset && $line =~ /^\[|type\s*=/) {
            $in_varset = 0;
        }
        
        # Hunt for value demons within varset controllers
        if ($in_varset) {
            # VALUE DEMON PATTERN 1: trigger1 = numeric_value (should be value = numeric_value)
            if ($line =~ /^(\s*)trigger1\s*=\s*(\d+)\s*$/) {
                my $indent = $1;
                my $value = $2;
                $lines[$i] = "${indent}value = $value\n";
                $file_demons++;
                print "   💀 LINE ${\($i+1)}: FIXED trigger1 = $value → value = $value\n";
            }
            
            # VALUE DEMON PATTERN 2: trigger1 = complex_expression (should be value = complex_expression)
            elsif ($line =~ /^(\s*)trigger1\s*=\s*(.+)\s*$/ && 
                   $2 !~ /^(time|command|anim|stateno|vel|pos|movetype|ctrl|statetype|!|p2|enemy|target|helper|root|numtarget|movecontact|movereversed|hitcount|roundstate|alive|power|life|dizzy|guard|standing|crouching|lying|gethit)/ &&
                   $2 !~ /^[<>=!&|]/) {
                my $indent = $1;
                my $expr = $2;
                # This looks like a value assignment disguised as trigger
                $lines[$i] = "${indent}value = $expr\n";
                $file_demons++;
                print "   💀 LINE ${\($i+1)}: FIXED trigger1 = $expr → value = $expr\n";
            }
            
            # VALUE DEMON PATTERN 3: Multiple trigger1 = 1 (usually second one should be value = something)
            elsif ($line =~ /^(\s*)trigger1\s*=\s*1\s*$/) {
                # Look for previous trigger1 in this varset
                my $has_previous_trigger = 0;
                for my $j ($varset_start_line..$i-1) {
                    if ($lines[$j] =~ /trigger1\s*=/) {
                        $has_previous_trigger = 1;
                        last;
                    }
                }
                
                if ($has_previous_trigger) {
                    # This is likely a corrupted value assignment
                    my $indent = $1;
                    $lines[$i] = "${indent}value = 1\n";
                    $file_demons++;
                    print "   💀 LINE ${\($i+1)}: FIXED duplicate trigger1 = 1 → value = 1\n";
                }
            }
        }
    }
    
    $total_value_demons += $file_demons;
    
    print "   💀 VALUE DEMONS EXTERMINATED: $file_demons\n";
    
    if ($file_demons > 0) {
        # Write purified content
        open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
        print $out_fh @lines;
        close($out_fh);
        print "   ✅ VALUE DEMON PURIFICATION COMPLETE!\n\n";
    } else {
        print "   ✅ NO VALUE DEMONS FOUND!\n\n";
    }
}

print "🚨💀 VALUE ASSIGNMENT DEMON HUNT COMPLETE! 💀🚨\n";
print "TOTAL VALUE DEMONS EXTERMINATED: $total_value_demons\n";

if ($total_value_demons > 0) {
    print "🏆 VARSET VALUE CORRUPTION ELIMINATED! 🏆\n";
} else {
    print "✅ NO VALUE ASSIGNMENT DEMONS DETECTED! ✅\n";
}