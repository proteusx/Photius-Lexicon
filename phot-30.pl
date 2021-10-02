#!/usr/bin/perl -w
#===============================================================================
#
#         FILE: phot-30.pl
#
#        USAGE: ./phot-30.pl <input_file>
#
#  DESCRIPTION: Converts utf-8 Photius lexicon Volume II from TLG to dsl format
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

my @lemas = split(/</, $phot_text);    # Split on '<>:'
shift @lemas;
foreach my $lema (@lemas){
  next if $lema =~ /(\{Ἀρχὴ σὺν θεῷ)|(\{Τέλος)/; # Not letter header lines
  my ($head, $body) = split />/, $lema;
  # unless ($body) {say $lema; next;}    # For debugging only
  $head =~ s/^\s+//;                    # Remove leading spaces
  $head = lc($head);                    # Lower case headwords
  $head =~ s/[^\x{0370}-\x{03df}\x{1f00}-\x{1ffe}\s]//g;  # Remove non Greek symbols
  $body =~ s/\n?\s+/ /gs;                # Strip \n and multiple spaces
  $body =~ s/\- //g;                     # Srtip hyphenation
  $body =~ s/^[:·]\s+//;
  $body =~ s/[\]\[]//g;
  $body =~ s/\s+$//;                    # Remove trailling spaces from body

  # Print in DSL format
  say $head;
  say "\t[m1]$body\[/m]";
}
