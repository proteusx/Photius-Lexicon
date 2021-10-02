#!/usr/bin/perl -w
#===============================================================================
#
#         FILE: phot.pl
#
#        USAGE: ./phot-29.pl <input_file>
#
#  DESCRIPTION: Converts utf-8 Photius lexicon Volume I from TLG to dsl format
#
#       AUTHOR: proteus (), proteuss@sdf.org
#      VERSION: 1.0
#      CREATED: 10/01/2021
#===============================================================================

use v5.10;
use strict;
use warnings;
use utf8;
use File::Slurp::Unicode;
binmode STDOUT, ":utf8";

my $phot_file = shift @ARGV;
my $phot_text = read_file($phot_file, encoding => 'utf8' );

my @lemas = split(/\x{a7}/, $phot_text);    # Split on §
shift @lemas;                               # Drop headings
shift @lemas;
shift @lemas;
foreach my $lema (@lemas){
  next if $lema =~ /(\{Ἀρχὴ σὺν θεῷ)|(\{Τέλος)/; # Not letter header lines
  my ($index, $head, $body);
  $lema =~ m/^(\w+(?:\s\w+)?\.(?:\d+|t))/; # Separate alphabetic index from rest
  $index = $1;
  my $rem = $';                         # The remainder is the headword + body
  next if $index =~ m/\.t$/;            # No letter titles
  $rem =~ s/\n?\s+/ /gs;                # Strip \n and multiple spaces
  $rem =~ s/\- //g;                     # Srtip hyphenation
  $rem =~ s/>/>·/;                      # Insert missing anw teleia
  $rem =~ s/··/·/;                      # where appropriate
  ($head, $body) = split(/[·:]/, $rem, 2); # split on first anw teleia or :
  # unless ($head) {say $rem; next;}    # For debugging only
  $head =~ s/<(.*?)>/$1/;               # Remove <, >
  $head =~ s/^\s+//;                    # Remove leading spaces
  $head = lc($head);                    # Lower case headwords
  $head =~ s/[^\x{0370}-\x{03df}\x{1f00}-\x{1ffe}\s]//g;  # Remove non Greek symbols
  $body =~ s/^\s+//;                    # Remove leading spaces from body
  $body =~ s/\s+$//;                    # Remove trailling spaces from body
  $body =~ s/[><]//g;                    # not needed.

  # Print in DSL format
  say $head;
  # say "\t[m1]$index\[/m]";            # uncomment to print index. Note, Volume 2 does not have them.
  say "\t[m1]$body\[/m]";
  say "";
}
