# Metal Slug 5 - No Slide

This project is a "simple" romhack to remove the slide feature from Metal Slug 5 for the NEOGEO.  Normally when you press Down + Jump you slide, with this patch you should instead jump.  This reverts it to the way it works in the older Metal Slug games.

![mslug5ns](https://github.com/user-attachments/assets/e659d4fd-f9eb-4fd0-b7ce-ebe84d909af0)

The patch only works for decrypted versions of Metal Slug 5.  For MAME I chose the "mslug5b" (bootleg) version of the game and for MiSTer it uses the rom provided in the @MiSTer Pack Add-on - NEOGEO romset.


## PATCHING ROM FOR MAME

### Prerequisites

- Entire ```mslug5b``` folder. You can find the names of the files required [here.](http://adb.arcadeitalia.net/dettaglio_mame.php?game_name=mslug5b) 
- ```ms5b-p1.bin``` P-ROM file (part of mslug5b folder)
   - MD5 = ```8DFAAE0E5FF75A49C79E9B59C6B26F17```
- [MAME-mslug5b-ms5b-p1.ips](https://github.com/Churchdill/MetalSlug5NoSlide/blob/master/ips/MAME-mslug5b-ms5b-p1.ips)

Step 1: Make sure you have a working version of Metal Slug 5 (BOOTLEG) for MAME.  
This is very specific, the patch will not work on any other encrypted versions of Metal Slug 5.  Note: I had to source the files from multiple places.

Step 2: Once you have it working in MAME, close it and apply the IPS patch ```MAME-mslug5b-ms5b-p1.ips``` to the ```ms5b-p1.bin``` file

Step 3: Run the game through MAME.  It will still be called Metal Slug 5 (Bootleg).  It will give checksum errors but it should work.

Step 4: Play!




## PATCHING ROM FOR MiSTer NEOGEO CORE

### Prerequisites

- ```Metal Slug 5 (mslug5).neo``` MiSter rom file.
   - MD5 = ```1D8E7CB3712B183F1323430F3770FEE6```
- [MiSTer-mslug5.ips](https://github.com/Churchdill/MetalSlug5NoSlide/blob/master/ips/MiSTer-mslug5.ips)


Step 1: Apply the IPS patch ```MiSTer-mslug5.ips``` to ```Metal Slug 5 (mslug5).neo``` file.  This is a very specific format of a pre-decrypted neogeo rom.  Chances are if you already have MiSTer working with NEOGEO you have this file.

Step 2: Rename your patched file to ```Metal Slug 5 - No Slide (mslug5ns).neo```.

Step 3: Edit your XML file on your MiSTer to recognize the romhack.  This is typically the path on MiSTer if you have your games on an SD card.

```media/fat/games/NEOGEO/romsets.xml```

After the "mslug5" line in the xml file add the following line, be mindful of syntax:

```<romset name="mslug5ns" pvc="1" altname="Metal Slug 5 - No Slide" publisher="Romhack" year="2026" ram="2"/```

Save and close romsets.xml

Step 4: Place the patched mslug5 rom "Metal Slug 5 - No Slide (mslug5ns).neo" into your roms folder. Typical path:

```media/fat/games/NEOGEO/ROMS/```

Step 5: Play!
