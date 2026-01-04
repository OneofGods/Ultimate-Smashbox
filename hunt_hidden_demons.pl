#!/usr/bin/perl
# 🔍💀 ADVANCED HIDDEN DEMON HUNTER 💀🔍
# Comprehensive scan for malformed syntax created by previous repairs

use strict;
use warnings;

my $total_demons_found = 0;
my @files_to_scan = (
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisystem.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morispecial.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisuper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morihelper.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/moridarkforce.st',
    'ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morinormal.st'
);

# DEMON PATTERNS TO DETECT
my @demon_patterns = (
    # Malformed repairs from previous scripts
    qr/!= 0\d+\) = \d+/,                    # != 02) = 3
    qr/= \d+\) \+/,                         # = 5) +
    qr/= \d+\) \-/,                         # = 5) -
    qr/= \d+\) \*/,                         # = 5) *
    qr/= \d+\) \//,                         # = 5) /
    qr/\|\| var\(\d+\)\d+\)/,               # || var(5)5)
    qr/&& var\(\d+\)\d+\)/,                 # && var(5)5)
    qr/var\(\d+\)\d+\)/,                    # var(5)5) 
    
    # Double parentheses errors
    qr/\(\d+\)\)/,                          # (5))
    qr/\(\(\d+\)/,                          # ((5)
    qr/\)\)\s*=/,                           # )) =
    qr/=\s*\)\)/,                           # = ))
    
    # Malformed operators
    qr/\)\s*\|\)\s*\|/,                     # ) |) |
    qr/\)\s*&\)\s*&/,                       # ) &) &
    qr/\|\)\|/,                             # |)|
    qr/&\)&/,                               # &)&
    
    # Broken function calls
    qr/trigger\d+\s*\)=/,                   # trigger1 )=
    qr/trigger\d+\s*\)\s*=/,                # trigger1 ) =
    qr/value\s*\)=/,                        # value )=
    
    # Mathematical demons missed
    qr/\b(abs|min|max|floor|ceil|sqrt|pow|mod|round|int|sign)\s*\(/,
    
    # Conditional demons missed  
    qr/\b(ifelse|cond)\s*\(/,
    
    # Engine function demons
    qr/\b(animelemno|motifstate|displaytoclipboard)\s*\(/,
    
    # Broken assignment patterns
    qr/=\s*var\(\d+\s+[+\-*\/]/,            # = var(5 +
    qr/var\(\d+\s*[^)]/,                     # var(5 (missing closing paren)
    
    # Syntax corruption patterns
    qr/\)\s*[+\-*\/]\s*\)/,                  # ) + )
    qr/\(\s*[+\-*\/]/,                       # ( +
    qr/[+\-*\/]\s*\)/,                       # + )
);

foreach my $file (@files_to_scan) {
    print "🔍 HUNTING hidden demons in: $file\n";
    
    if (!-f $file) {
        print "⚠️  File not found: $file\n";
        next;
    }
    
    # Read file line by line
    open(my $fh, '<', $file) or die "Cannot open $file: $!";
    my $line_num = 0;
    my $file_demons = 0;
    
    while (my $line = <$fh>) {
        $line_num++;
        chomp $line;
        
        # Check each demon pattern
        foreach my $pattern (@demon_patterns) {
            if ($line =~ /$pattern/) {
                print "   💀 DEMON FOUND - Line $line_num: $line\n";
                $file_demons++;
                $total_demons_found++;
            }
        }
    }
    
    close($fh);
    
    print "   Hidden demons in file: $file_demons\n";
    print "   ✅ Hunt complete!\n\n";
}

print "🔍💀 HIDDEN DEMON HUNT COMPLETE! 💀🔍\n";
print "TOTAL HIDDEN DEMONS DETECTED: $total_demons_found\n";

if ($total_demons_found > 0) {
    print "🚨 WARNING: DEMONS STILL ACTIVE! IMMEDIATE EXTERMINATION REQUIRED! 🚨\n";
} else {
    print "🏆 NO HIDDEN DEMONS DETECTED! MORRIGAN IS CLEAN! 🏆\n";
}