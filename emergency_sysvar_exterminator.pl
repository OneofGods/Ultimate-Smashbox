#!/usr/bin/perl
# 🚨💀 EMERGENCY SYSVAR DEMON EXTERMINATION SCRIPT 💀🚨
# Targeted elimination of system variable demons that survived previous purges

use strict;
use warnings;

my $total_sysvar_demons = 0;
my @files_to_purify = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisystem.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morispecial.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisuper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morihelper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/moridarkforce.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morinormal.st'
);

print "🚨💀 EMERGENCY SYSVAR DEMON EXTERMINATION PROTOCOL 💀🚨\n";
print "TARGETING SYSTEM VARIABLE DEMONS...\n\n";

foreach my $file (@files_to_purify) {
    print "🚨 EMERGENCY PURGE: $file\n";
    
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
    
    print "   🔍 Hunting sysvar demons...\n";
    
    # SYSVAR EXTERMINATION PHASE 1: Fix orphaned sysvar calls
    # trigger1 = sysvar(0 -> trigger1 = sysvar(0) != 0
    my $before = () = $content =~ /trigger\d+\s*=\s*sysvar\(\d+(?!\))/g;
    $content =~ s/(trigger\d+\s*=\s*sysvar\(\d+)(?!\))/$1) != 0/g;
    my $after = () = $content =~ /trigger\d+\s*=\s*sysvar\(\d+(?!\))/g;
    $file_demons += ($before - $after);
    
    # SYSVAR EXTERMINATION PHASE 2: Fix malformed triggerall sysvar
    # triggerall )= sysvar(0) && -> triggerall = sysvar(0) != 0 &&
    $before = () = $content =~ /triggerall\s*\)\s*=\s*sysvar\(/g;
    $content =~ s/triggerall\s*\)\s*=\s*sysvar\(/triggerall = sysvar(/g;
    $after = () = $content =~ /triggerall\s*\)\s*=\s*sysvar\(/g;
    $file_demons += ($before - $after);
    
    # SYSVAR EXTERMINATION PHASE 3: Fix sysvar assignments that should be comparisons
    # Lines like "sysvar(0) = vel y > 0" should be "trigger1 = vel y > 0"
    $before = () = $content =~ /^\s*sysvar\(\d+\)\s*=\s*[^=]/gm;
    $content =~ s/^(\s*)sysvar\(\d+\)\s*=\s*/$1trigger1 = /gm;
    $after = () = $content =~ /^\s*sysvar\(\d+\)\s*=\s*[^=]/gm;
    $file_demons += ($before - $after);
    
    # SYSVAR EXTERMINATION PHASE 4: Ensure all sysvar references have proper syntax
    # Any remaining sysvar( without ) should get ) != 0
    $before = () = $content =~ /sysvar\(\d+(?![)])/g;
    $content =~ s/(sysvar\(\d+)(?![)])/$1) != 0/g;
    $after = () = $content =~ /sysvar\(\d+(?![)])/g;
    $file_demons += ($before - $after);
    
    $total_sysvar_demons += $file_demons;
    
    print "   💀 SYSVAR DEMONS EXTERMINATED: $file_demons\n";
    
    if ($content ne $original_content) {
        # Write purified content
        open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
        print $out_fh $content;
        close($out_fh);
        print "   ✅ SYSVAR PURIFICATION COMPLETE!\n\n";
    } else {
        print "   ✅ NO SYSVAR DEMONS FOUND!\n\n";
    }
}

print "🚨💀 EMERGENCY SYSVAR EXTERMINATION COMPLETE! 💀🚨\n";
print "TOTAL SYSVAR DEMONS EXTERMINATED: $total_sysvar_demons\n";

if ($total_sysvar_demons > 0) {
    print "🏆 SYSVAR DEMON COLONY DESTROYED! 🏆\n";
} else {
    print "✅ NO SYSVAR DEMONS DETECTED - SYSTEMS CLEAN! ✅\n";
}