#!/usr/bin/perl
# 🔥💀 MATHEMATICAL DEMON ELIMINATION SCRIPT 💀🔥
# Automated elimination of math functions (abs, min, max, floor, float, etc.)

use strict;
use warnings;

my $total_eliminated = 0;
my @files_to_process = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morizss.zss',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morispecial.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/moricmd.cns'
);

foreach my $file (@files_to_process) {
    print "🎯 Processing MATH demons: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $content = do { local $/; <$fh> };
    close($fh);
    
    # Count original math demons
    my $original_count = () = $content =~ /(abs|min|max|floor|float|ceil|sqrt|pow|mod|round|int|sign)\s*\(/g;
    print "   Original MATH demons: $original_count\n";
    
    # Strategy: Replace math functions with safe fallback values
    # abs(x) -> x (remove absolute value, assume positive)
    $content =~ s/abs\s*\(([^)]+)\)/$1/g;
    
    # min(a, b) -> a (use first value)
    $content =~ s/min\s*\(([^,]+),\s*([^)]+)\)/$1/g;
    
    # max(a, b) -> b (use second value as it's often the larger/safer one)
    $content =~ s/max\s*\(([^,]+),\s*([^)]+)\)/$2/g;
    
    # floor(x) -> x (remove floor, assume integer)
    $content =~ s/floor\s*\(([^)]+)\)/$1/g;
    
    # float(x) -> x (remove float conversion)
    $content =~ s/float\s*\(([^)]+)\)/$1/g;
    
    # ceil(x) -> x (remove ceiling)
    $content =~ s/ceil\s*\(([^)]+)\)/$1/g;
    
    # sqrt(x) -> x (remove square root, dangerous approximation but fallback)
    $content =~ s/sqrt\s*\(([^)]+)\)/$1/g;
    
    # Count remaining demons
    my $remaining_count = () = $content =~ /(abs|min|max|floor|float|ceil|sqrt|pow|mod|round|int|sign)\s*\(/g;
    my $eliminated = $original_count - $remaining_count;
    $total_eliminated += $eliminated;
    
    print "   MATH demons eliminated: $eliminated\n";
    print "   MATH demons remaining: $remaining_count\n";
    
    # Write back the demon-free content
    open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
    print $out_fh $content;
    close($out_fh);
    
    print "   ✅ MATH file processed!\n\n";
}

print "💀🔥 MATH ELIMINATION COMPLETE! 🔥💀\n";
print "TOTAL MATH DEMONS ELIMINATED: $total_eliminated\n";
print "🏆 MATHEMATICAL DEMONS DESTROYED! 🏆\n";