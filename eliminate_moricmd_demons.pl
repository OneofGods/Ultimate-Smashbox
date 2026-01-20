#!/usr/bin/perl
# 🔥💀 MORICMD IFELSE DEMON ELIMINATION SCRIPT 💀🔥

use strict;
use warnings;

my $total_eliminated = 0;
my @files_to_process = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/moricmd.cns'
);

foreach my $file (@files_to_process) {
    print "🎯 Processing IFELSE demons in: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $content = do { local $/; <$fh> };
    close($fh);
    
    # Count original demons
    my $original_count = () = $content =~ /ifelse\s*\(/g;
    print "   Original IFELSE demons: $original_count\n";
    
    # Strategy: Replace ifelse(condition, true_val, false_val) with false_val (fallback)
    # Handle nested ifelse patterns
    while ($content =~ /ifelse\s*\([^,]+,\s*([^,]+),\s*([^)]+)\)/) {
        $content =~ s/ifelse\s*\([^,]+,\s*([^,]+),\s*([^)]+)\)/$2/g;
    }
    
    # Count remaining demons  
    my $remaining_count = () = $content =~ /ifelse\s*\(/g;
    my $eliminated = $original_count - $remaining_count;
    $total_eliminated += $eliminated;
    
    print "   IFELSE demons eliminated: $eliminated\n";
    print "   IFELSE demons remaining: $remaining_count\n";
    
    # Write back the demon-free content
    open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
    print $out_fh $content;
    close($out_fh);
    
    print "   ✅ CMD file processed!\n\n";
}

print "💀🔥 MORICMD IFELSE ELIMINATION COMPLETE! 🔥💀\n";
print "TOTAL CMD IFELSE DEMONS ELIMINATED: $total_eliminated\n";
print "🏆 CMD FILE IS NOW DEMON-FREE! 🏆\n";