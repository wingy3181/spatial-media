1. Export GoPro Max 360 videos to mov using GoPro Player Desktop MacOs application. 
   a. File -> Export As -> 5.6K... -> Next -> <Use File Dialog to select location of export .mov file to be ./videos/input.mov>
   b. From root, run `python3 spatialmedia -i ./videos/input.mov ./videos/output.mov` to inject spatial metadata into the .mov file
