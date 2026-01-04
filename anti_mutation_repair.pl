#!/usr/bin/perl
# 🚨💀 ANTI-MUTATION EMERGENCY REPAIR PROTOCOL 💀🚨
# FIXES REGENERATING DEMON PATTERNS CREATED BY OUR OWN SCRIPTS

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

my $total_mutations_fixed = 0;

print "🚨💀 ANTI-MUTATION REPAIR PROTOCOL ACTIVATED 💀🚨\n";
print "TARGETING REGENERATING DEMON PATTERNS...\n\n";

foreach my $file (@files_to_fix) {
    print "🔧 REPAIRING MUTATIONS: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file content
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $content = do { local $/; <$fh> };
    close($fh);
    
    my $original_content = $content;
    my $file_mutations = 0;
    
    # ANTI-MUTATION PATTERN FIXES
    
    # 1. Fix corrupted varset controllers with missing trigger1 and duplicate value
    my $mutation_count = 0;
    $mutation_count += ($content =~ s/(\[State [^\]]+\]\ntype = varset\n)value = 1\nvalue = ([^\n]+)\nvar\((\d+)\) = (\d+)/$1trigger1 = !time\nvar($3) = $4/g);
    $file_mutations += $mutation_count;
    if ($mutation_count > 0) {
        print "   💀 Fixed $mutation_count corrupted varset controllers\n";
    }
    
    # 2. Fix orphaned value assignments in varset
    $mutation_count = ($content =~ s/(\[State [^\]]+\]\ntype = varset\n)value = ([^\n]+)\n(\w+\(\d+\) = \d+)/$1trigger1 = !time\n$3/g);
    $file_mutations += $mutation_count;
    if ($mutation_count > 0) {
        print "   💀 Fixed $mutation_count orphaned value assignments\n";
    }
    
    # 3. Fix missing trigger1 in varset controllers
    $mutation_count = ($content =~ s/(\[State [^\]]+\]\ntype = varset\n)(var\(\d+\) = [^\n]+)/$1trigger1 = !time\n$2/g);
    $file_mutations += $mutation_count;
    if ($mutation_count > 0) {
        print "   💀 Fixed $mutation_count missing trigger1 statements\n";
    }
    
    # 4. Fix duplicate value lines
    $mutation_count = ($content =~ s/value = 1\nvalue = ([^\n]+)/trigger1 = !time\nvalue = $1/g);
    $file_mutations += $mutation_count;
    if ($mutation_count > 0) {
        print "   💀 Fixed $mutation_count duplicate value lines\n";
    }
    
    # 5. Fix orphaned variables after type = varset
    $mutation_count = ($content =~ s/(type = varset)\n(var\(\d+\) = [^\n]+)/$1\ntrigger1 = !time\n$2/g);
    $file_mutations += $mutation_count;
    if ($mutation_count > 0) {
        print "   💀 Fixed $mutation_count orphaned variable assignments\n";
    }
    
    $total_mutations_fixed += $file_mutations;
    
    # Write back only if changes were made
    if ($content ne $original_content) {
        open($fh, '>', $file) or die "Cannot write $file: $!";
        print $fh $content;
        close($fh);
        print "   📊 MUTATIONS FIXED IN FILE: $file_mutations\n";
    } else {
        print "   ✅ No mutations found in file!\n";
    }
    print "   🔧 Anti-mutation repair complete!\n\n";
}

print "🚨💀 ANTI-MUTATION REPAIR COMPLETE! 💀🚨\n";
print "TOTAL MUTATIONS FIXED: $total_mutations_fixed\n";

if ($total_mutations_fixed > 0) {
    print "🏆 REGENERATING DEMONS NEUTRALIZED! 🏆\n";
} else {
    print "✅ NO MUTATIONS DETECTED! FILES ARE STABLE! ✅\n";
}

print "\n🔧 ANTI-MUTATION PROTOCOL COMPLETE 🔧\n";