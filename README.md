# Photius Lexicon For GoldenDict

## DESCRIPTION

The [Photius
Lexicon](https://archive.org/details/photiipatriarcha02phot/mode/2up) is a
rare dictionary of Greek words
compiled during the 7th century A.D. by [Photius](https://en.wikipedia.org/wiki/Photios_I_of_Constantinople)
who was a Patriarch of Constantinople. The lexicon contains more
than 14,000 lemmata. As always, the [printed
dictionary](https://www.amazon.com/PHOTII-PHOTIUS-PATRIARCHAE-LEXICON-VOLUMES/dp/B00HCL1XXI)
is rather expensive but it can be found in pdf format for download.
It also exists in the [TLG
CDROM](http://stephanus.tlg.uci.edu/tlgauthors/cd.authors.php) in Beta Code format.


**Photius Lexicon For GoldenDict** is a utility to decode the text of Photius
Lexicon, taken from the TLG CDROM,
into utf-8 text, and then compile the data into a ABBYY Lingvo .dsl dictionary file that can be used with
the digital dictionary lookup program [GoldenDict]( http://goldendict.org/), so
that the Photius Lexicon can be searched like any other modern dictionary.

## DEPENDENCIES
The **Photius Lexicon For GoldenDict** building script is meant to be run within a Linux environment.
It requires the following mostly standard UNIX tools:

* [tlg2u](https://github.com/proteusx/tlg2u), this is the beta-code to utf-8 text conversion
    utility.
* Bash
* Perl
* Patch
* Sed
* TLG CDROM. This is no longer sold but it can be found via bit torrents.


## USAGE

Clone the Github repository: `git clone https://github.com/proteusx/Photius-For-GoldenDict.git`

Edit the first line of the file `build-photius.sh`. The variable `TLG_CDROM` must
contain the path to the TLG CDROM files.

Run the script: `build-photius.sh`

If everything is in order the file **`dictionary/photius.dsl`** should be produced.  Point
GoldenDict to this folder and the Photius Lexicon is ready to search.  Alternatively you may
copy the folder **`dictionary`** to some other location.

There is also a release with `photius.dsl` compiled and ready to use.

## NOTES
Photius Lexicon as encoded in the TLG CDROM is sourced from these hard copy
editions:

* Photii patriarchae lexicon, vol. 1 (Α—Δ), Theodoridis, C. (Ed) Berlin: De
 Gruyter, 1982,
* Φωτίου τοῦ πατριάρχου λέξεων συναγωγή, Porson, R. (Ed)
 Cambridge: Cambridge University Press, 1822.

The original proem of the lexicon (also taken from the TLG) is included in the dictionary annotations file
`dictionary/photius.ann`.  There, Photius gives an account of his sources and gives instructions for the use of the lexicon. It is very interesting reading and you can either read it with a text editor, or read
it after installation from the **Dictionary information** of GoldenDict.


## SEE ALSO
More Ancient Greek Dictionaries:

* <https://github.com/proteusx/Suda-For-GoldenDict>
* <https://github.com/proteusx/Hesychius-For-GoldenDict>
* <https://github.com/proteusx/Etymologicum-Magnum>



<!-- vim: set tw=80 spell fo=tq: -->
