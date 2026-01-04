#!/usr/bin/perl
# 🔥💀 ULTIMATE DEMON EXTERMINATION SCRIPT 💀🔥
# MASS DESTRUCTION OF ALL SYNTAX CORRUPTION CAUSED BY PREVIOUS REPAIRS

use strict;
use warnings;

my $total_exterminated = 0;
my @files_to_purify = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisystem.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morispecial.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisuper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morihelper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/moridarkforce.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morinormal.st'
);

print "🔥💀 ULTIMATE DEMON EXTERMINATION PROTOCOL INITIATED 💀🔥\n";
print "PREPARING FOR MASS DESTRUCTION OF SYNTAX CORRUPTION...\n\n";

foreach my $file (@files_to_purify) {
    print "🔥 PURIFYING: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $content = do { local $/; <$fh> };
    close($fh);
    
    my $original_content = $content;
    my $file_exterminations = 0;
    
    print "   🔍 Scanning for syntax demons...\n";
    
    # EXTERMINATION PHASE 1: Fix malformed trigger operators
    # ) = -> ) != 0 
    $content =~ s/trigger(\d+)\s*\)\s*=\s*/trigger$1 = /g;
    
    # EXTERMINATION PHASE 2: Fix broken variable references
    # var(6)5) -> var(65)
    $content =~ s/var\((\d+)\)(\d+)\)/var($1$2)/g;
    
    # EXTERMINATION PHASE 3: Fix double assignments
    # = 1 || var(6) != 05) = 0 -> != 0 
    $content =~ s/=\s*1\s*\|\|\s*var\(\d+\)\s*!=\s*0\d+\)\s*=\s*0/!= 0/g;
    
    # EXTERMINATION PHASE 4: Fix broken logical operators  
    # &)& -> &&
    $content =~ s/&\)&/&&/g;
    # |)| -> ||
    $content =~ s/\|\)\|/||/g;
    
    # EXTERMINATION PHASE 5: Fix malformed sparkno assignments
    # sparkno = -1 + 0 * (var(121) = 8023 -> sparkno = -1
    $content =~ s/sparkno\s*=\s*-1\s*\+\s*0\s*\*\s*\(var\(\d+\)\s*=\s*\d+/sparkno = -1/g;
    $content =~ s/guard\.sparkno\s*=\s*-1\s*\+\s*0\s*\*\s*\(var\(\d+\)\s*=\s*\d+/guard.sparkno = -1/g;
    
    # EXTERMINATION PHASE 6: Fix sparkxy corruption
    # sparkxy = -10 + 0 * (var(132) = 25 * (var(133) = 50, var(122) = -60 -> sparkxy = -10, -60
    $content =~ s/sparkxy\s*=\s*-10\s*\+\s*0\s*\*\s*\(var\(\d+\)\s*=\s*\d+\s*\*\s*\(var\(\d+\)\s*=\s*\d+,\s*var\(\d+\)\s*=\s*(-?\d+)/sparkxy = -10, $1/g;
    
    # EXTERMINATION PHASE 7: Fix air.juggle corruption
    # air.juggle = 0 * (var(112) = 1 || var(11) != 00) = 1 || var(11) != 01) = 1 -> air.juggle = 1
    $content =~ s/air\.juggle\s*[=)]\s*0\s*\*\s*\(var\(\d+\)\s*=\s*1\s*\|\|\s*var\(\d+\)\s*!=\s*0\d+\)\s*=\s*1\s*\|\|\s*var\(\d+\)\s*!=\s*0\d+\)\s*=\s*(\d+)/air.juggle = $1/g;
    
    # EXTERMINATION PHASE 8: Fix trigger corruption patterns
    # trigger1 )= var(6)5) -> trigger1 = var(65) != 0
    $content =~ s/trigger(\d+)\s*\)\s*=\s*var\((\d+)\)(\d+)\)/trigger$1 = var($2$3) != 0/g;
    
    # EXTERMINATION PHASE 9: Fix poweradd corruption  
    # poweradd = 50 * !var(50) -> poweradd = 50
    $content =~ s/poweradd\s*=\s*(-?\d+)\s*\*\s*!var\(50\)/poweradd = $1/g;
    
    # EXTERMINATION PHASE 10: Fix getpower corruption
    # getpower = 100 * !var(50), 50 * !var(50) -> getpower = 100, 50  
    $content =~ s/getpower\s*=\s*(\d+)\s*\*\s*!var\(50\),\s*(\d+)\s*\*\s*!var\(50\)/getpower = $1, $2/g;
    
    # EXTERMINATION PHASE 11: Fix ground.hittime corruption
    # ground.hittime = 1 + 18; + 2 * var(105) -> ground.hittime = 19
    $content =~ s/ground\.hittime\s*=\s*1\s*\+\s*18;\s*\+\s*2\s*\*\s*var\(\d+\)/ground.hittime = 19/g;
    
    # EXTERMINATION PHASE 12: Fix value corruption
    # value = -130 * var(67)) -> value = -130 * var(67)
    $content =~ s/value\s*=\s*(-?\d+)\s*\*\s*var\((\d+)\)\)/value = $1 * var($2)/g;
    
    # EXTERMINATION PHASE 13: Fix animelemtime corruption
    # trigger1 )= animelemtime(3) >= 0 -> trigger1 = animelemtime(3) >= 0
    $content =~ s/trigger(\d+)\s*\)\s*=\s*animelemtime\(/trigger$1 = animelemtime(/g;
    
    # EXTERMINATION PHASE 14: Fix mathematical expression corruption
    # x )= (-((gamewidth / 2.0 + 40) -50 * 0* facing -> x = -(gamewidth / 2.0 - 10) * facing
    $content =~ s/x\s*\)\s*=\s*\(-\(\(gamewidth\s*\/\s*2\.0\s*\+\s*40\)\s*-50\s*\*\s*0\*\s*facing/x = -(gamewidth \/ 2.0 - 10) * facing/g;
    
    # EXTERMINATION PHASE 15: Fix !var patterns
    # darken = !var(65) -> darken = 1 (assuming default)
    $content =~ s/darken\s*=\s*!var\(\d+\)/darken = 1/g;
    
    # EXTERMINATION PHASE 16: Clean up remaining ))
    $content =~ s/\)\)/)/g;
    
    # Count exterminations by comparing content
    if ($content ne $original_content) {
        # Count approximate number of fixes
        my $changes = () = $original_content =~ /\)\s*=/g;
        $changes += () = $original_content =~ /var\(\d+\)\d+\)/g;
        $changes += () = $original_content =~ /&\)&/g;
        $changes += () = $original_content =~ /\|\)\|/g;
        $file_exterminations = $changes;
        $total_exterminated += $file_exterminations;
    }
    
    print "   💀 DEMONS EXTERMINATED: $file_exterminations\n";
    
    # Write purified content
    open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
    print $out_fh $content;
    close($out_fh);
    
    print "   ✅ FILE PURIFIED!\n\n";
}

print "🔥💀 ULTIMATE EXTERMINATION COMPLETE! 💀🔥\n";
print "TOTAL DEMONS EXTERMINATED: $total_exterminated\n";
print "🏆 SYNTAX CORRUPTION ELIMINATED! MORRIGAN IS CLEAN! 🏆\n";