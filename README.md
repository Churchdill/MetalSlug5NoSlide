PATCHING ROM FOR MAME

ms5b-p1.bin
MD5 = 8DFAAE0E5FF75A49C79E9B59C6B26F17


Step 1: Make sure you have a working version of Metal Slug 5 (BOOTLEG) on MAME.  
This is very specific, the patch will not work on any other encrypted versions of Metal Slug 5.
This website shows you exactly the files MAME wants to boot the game correctly.  I had to source the files from multiple places.
http://adb.arcadeitalia.net/dettaglio_mame.php?game_name=mslug5b

Step 2: Once you have it working in MAME, close it and apply the IPS patch "MAME-mslug5b-ms5b-p1.ips" to the "ms5b-p1.bin" file

Step 3: Run the game through MAME.  It will be called Metal Slug 5 (Bootleg).  It will give checksum errors but it should work.




PATCHING ROM FOR MiSTer NEOGEO CORE

Metal Slug 5 (mslug5).neo
MD5 = 1D8E7CB3712B183F1323430F3770FEE6


Step 1: Apply the IPS patch "MiSTer-mslug5.ips" to "Metal Slug 5 (mslug5).neo" file.  This is a very specific format of a pre-decrypted neogeo rom.  
Chances are if you already have MiSTer working with NEOGEO you have this file.

Step 2: Rename your patched file to "Metal Slug 5 - No Slide (mslug5ns).neo" without the quotes.

Step 3: Edit your XML file on your MiSTer to recognize the romhack.  This is typically the path on MiSTer if you have your games on an SD card.
media/fat/games/NEOGEO/romsets.xml

After "mslug5" add the following line...:
<romset name="mslug5ns" pvc="1" altname="Metal Slug 5 - No Slide" publisher="Romhack" year="2026" ram="2"/>

save and close.

Step 4: Place the patched mslug5 rom (Metal Slug 5 - No Slide (mslug5ns).neo) into your roms folder. Typical path:
media/fat/games/NEOGEO/ROMS/romsets.xml

Step 5: Play!