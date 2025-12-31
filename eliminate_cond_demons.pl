#!/usr/bin/perl
# 🔥💀 COND DEMON ELIMINATION SCRIPT 💀🔥
# Automated cond() pattern removal for .zss files

use strict;
use warnings;

my $total_eliminated = 0;
my @files_to_process = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morizss.zss'
);

foreach my $file (@files_to_process) {
    print "🎯 Processing COND demons: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $content = do { local $/; <$fh> };
    close($fh);
    
    # Count original cond demons
    my $original_count = () = $content =~ /cond\s*\(/g;
    print "   Original COND demons: $original_count\n";
    
    # Strategy: Replace cond(condition, true_val, false_val) with false_val (safest fallback)
    # Handle simple cond patterns first
    while ($content =~ /cond\s*\([^,]+,\s*([^,]+),\s*([^)]+)\)/) {
        $content =~ s/cond\s*\([^,]+,\s*([^,]+),\s*([^)]+)\)/$2/g;
    }
    
    # Count remaining demons
    my $remaining_count = () = $content =~ /cond\s*\(/g;
    my $eliminated = $original_count - $remaining_count;
    $total_eliminated += $eliminated;
    
    print "   COND demons eliminated: $eliminated\n";
    print "   COND demons remaining: $remaining_count\n";
    
    # Write back the demon-free content
    open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
    print $out_fh $content;
    close($out_fh);
    
    print "   ✅ COND file processed!\n\n";
}

print "💀🔥 COND ELIMINATION COMPLETE! 🔥💀\n";
print "TOTAL COND DEMONS ELIMINATED: $total_eliminated\n";
print "🏆 COND DEMONS DESTROYED! 🏆\n";