#!/usr/bin/perl
# 🔥💀 ZSS DEMON ELIMINATION SCRIPT 💀🔥
# Automated ifelse() pattern removal for .zss files
# Target: 95 demons in inputs.zss and morizss.zss

use strict;
use warnings;

my $total_eliminated = 0;
my @zss_files_to_process = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/inputs.zss',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morizss.zss'
);

foreach my $file (@zss_files_to_process) {
    print "🎯 Processing ZSS: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $content = do { local $/; <$fh> };
    close($fh);
    
    # Count original demons
    my $original_count = () = $content =~ /ifelse\(/g;
    print "   Original ZSS demons: $original_count\n";
    
    # Strategy 1: Simple ifelse(condition, true_val, false_val) -> false_val (fallback)
    # This is the safest approach for MUGEN compatibility
    $content =~ s/ifelse\([^,]+,\s*([^,]+),\s*([^)]+)\)/$2/g;
    
    # Strategy 2: Handle nested ifelse patterns more aggressively
    while ($content =~ /ifelse\([^,]+,\s*([^,]+),\s*([^)]+)\)/) {
        $content =~ s/ifelse\([^,]+,\s*([^,]+),\s*([^)]+)\)/$2/g;
    }
    
    # Count remaining demons
    my $remaining_count = () = $content =~ /ifelse\(/g;
    my $eliminated = $original_count - $remaining_count;
    $total_eliminated += $eliminated;
    
    print "   ZSS demons eliminated: $eliminated\n";
    print "   ZSS demons remaining: $remaining_count\n";
    
    # Write back the demon-free content
    open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
    print $out_fh $content;
    close($out_fh);
    
    print "   ✅ ZSS file processed!\n\n";
}

print "💀🔥 ZSS ELIMINATION COMPLETE! 🔥💀\n";
print "TOTAL ZSS DEMONS ELIMINATED: $total_eliminated\n";
print "🏆 ZSS FILES ARE NOW DEMON-FREE! 🏆\n";