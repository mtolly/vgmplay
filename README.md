This is a quick hack of `vgmplay` to extract each sample layer from a MultiPCM
song file. It simply rebuilds the program repeatedly to only load one sample
index at a time and zeroes out the others. Each WAV is then encoded to FLAC
as it goes because they get very big otherwise and are mostly silence.

```
$ cd VGMPlay
$ mv .../thesongfile.vgz .
$ ./multipcm-stems.sh thesongfile
// `stems` folder will be created and populated
```

Only tested on Mac; on other platforms you should remove `MACOSX=1` from the
script and make whatever other edits are necessary to build correctly.
