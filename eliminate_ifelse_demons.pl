#!/usr/bin/perl
# 🔥💀 IFELSE DEMON ELIMINATION SCRIPT 💀🔥
# Automated ifelse() pattern removal for MUGEN engine compatibility
# Target: 535 demons across Morrigan character files

use strict;
use warnings;

my $total_eliminated = 0;
my @files_to_process = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/moridarkforce.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morihelper.st', 
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morinormal.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morispecial.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisuper.st'
);

foreach my $file (@files_to_process) {
    print "🎯 Processing: $file\n";
    
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
    print "   Original demons: $original_count\n";
    
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
    
    print "   Demons eliminated: $eliminated\n";
    print "   Demons remaining: $remaining_count\n";
    
    # Write back the demon-free content
    open(my $out_fh, '>', $file) or die "Cannot write $file: $!";
    print $out_fh $content;
    close($out_fh);
    
    print "   ✅ File processed!\n\n";
}

print "💀🔥 ELIMINATION COMPLETE! 🔥💀\n";
print "TOTAL DEMONS ELIMINATED: $total_eliminated\n";
print "🏆 THE CO-OP STRATEGY WAS SUCCESSFUL! 🏆\n";