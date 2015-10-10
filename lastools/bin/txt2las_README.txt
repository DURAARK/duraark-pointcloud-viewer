****************************************************************

  txt2las:

  Converts LIDAR data from a standard ASCII format into the more
  efficient binary LAS/LAZ/BIN representations.

  Reads also directy from *.gz, *.zip, *.rar, and *.7z files if
  the corresponding gzip.exe, unzip.exe, unrar.exe, and 7z.exe
  are in the same folder.

  Allows adding a VLR to the header with projection information.

  If your input text file is PTS or PTX format you can preserve
  the extra header information of these files. Simply add the
  appropriate '-ipts' or '-iptx' switch to the command line which
  will store this in a VLR. You can later reconstruct the PTS or
  PTX files with 'las2las' or 'las2txt' by adding the corresponding
  '-opts' or '-optx' option to the command line.

  It is also possible to pipe the ASCII into txt2las. For this you
  will need to add both '-stdin' and '-itxt' to the command-line.
 
  For updates check the website or join the LAStools mailing list.

  http://rapidlasso.com/LAStools
  http://lastools.org/
  http://groups.google.com/group/lastools/
  http://twitter.com/LAStools
  http://facebook.com/LAStools
  http://linkedin.com/groups?gid=4408378

  Martin @rapidlasso

****************************************************************

example usage:

>> txt2las -i lidar.txt.gz -o lidar.las -parse ssxyz

converts a gzipped ASCII file and uses the 3rd, 4th, and 5th entry
of each line as the x, y, and z coordinate of each point

>> txt2las -i lidar.zip -o lidar.laz -parse ssxyz -utm 14T

same as above for a zipped ASCII file but produces compressed LAZ
and adds projection info for utm zone with wgs84 

>> txt2las -i lidar.txt -o lidar.laz -parse xyzai -scale_scan_angle 57.3 -scale_intensity 65535

also reads the 4th entry as the scan angle and multiplies it by 57.3
(radian to angle) and the 5th entry as the intensity and multiplies
it by 65535 (converts range [0.0 .. 1.0] to range [0 .. 65535]. then
produces a compressed LAZ file.

>> txt2las -skip 3 -i lidar.txt.gz -o lidar.las -parse txyzsa -sp83 OH_N

converts a gzipped ASCII file and uses the 1st entry of each line
as the gps time, the 3rd, 4th, and 5th entry as the x, y, and z
coordinate of each point, and the 6th entry as the scan angle. it
skips the first three lines of the ASCII data file and adds projection
info for state plane ohio north with nad83. 

>> txt2las -i lidar.txt.gz -o lidar.laz -parse xyzRGB -set_scale 0.001 0.001 0.001 -set_offset 500000 4000000 0

converts a gzipped ASCII file and uses the 1st 2nd, and 3rd entry
of each line as the x, y, and z coordinate of each point, and the
4th, 5th, and 6th entry as the RGB color. the created compressed
LAZ file will have a precision of 0.001 0.001 0.001 and an offset
of 500000 4000000 0

for more info:

C:\lastools\bin>txt2las -h
Filter points based on their coordinates.
  -keep_tile 631000 4834000 1000 (ll_x ll_y size)
  -keep_circle 630250.00 4834750.00 100 (x y radius)
  -keep_xy 630000 4834000 631000 4836000 (min_x min_y max_x max_y)
  -drop_xy 630000 4834000 631000 4836000 (min_x min_y max_x max_y)
  -keep_x 631500.50 631501.00 (min_x max_x)
  -drop_x 631500.50 631501.00 (min_x max_x)
  -drop_x_below 630000.50 (min_x)
  -drop_x_above 630500.50 (max_x)
  -keep_y 4834500.25 4834550.25 (min_y max_y)
  -drop_y 4834500.25 4834550.25 (min_y max_y)
  -drop_y_below 4834500.25 (min_y)
  -drop_y_above 4836000.75 (max_y)
  -keep_z 11.125 130.725 (min_z max_z)
  -drop_z 11.125 130.725 (min_z max_z)
  -drop_z_below 11.125 (min_z)
  -drop_z_above 130.725 (max_z)
  -keep_xyz 620000 4830000 100 621000 4831000 200 (min_x min_y min_z max_x max_y max_z)
  -drop_xyz 620000 4830000 100 621000 4831000 200 (min_x min_y min_z max_x max_y max_z)
Filter points based on their return number.
  -first_only -keep_first -drop_first
  -last_only -keep_last -drop_last
  -keep_middle -drop_middle
  -keep_return 1 2 3
  -drop_return 3 4
  -keep_single -drop_single
  -keep_double -drop_double
  -keep_triple -drop_triple
  -keep_quadruple -drop_quadruple
  -keep_quintuple -drop_quintuple
Filter points based on the scanline flags.
  -drop_scan_direction 0
  -scan_direction_change_only
  -edge_of_flight_line_only
Filter points based on their intensity.
  -keep_intensity 20 380
  -drop_intensity_below 20
  -drop_intensity_above 380
  -drop_intensity_between 4000 5000
Filter points based on their classification.
  -keep_class 1 3 7
  -drop_class 4 2
  -drop_synthetic -keep_synthetic
  -drop_keypoint -keep_keypoint
  -drop_withheld -keep_withheld
Filter points based on their user data.
  -keep_user_data 1
  -drop_user_data 255
  -keep_user_data_between 10 20
  -drop_user_data_below 1
  -drop_user_data_above 100
  -drop_user_data_between 10 40
Filter points based on their point source ID.
  -keep_point_source 3
  -keep_point_source_between 2 6
  -drop_point_source 27
  -drop_point_source_below 6
  -drop_point_source_above 15
  -drop_point_source_between 17 21
Filter points based on their scan angle.
  -keep_scan_angle -15 15
  -drop_abs_scan_angle_above 15
  -drop_scan_angle_below -15
  -drop_scan_angle_above 15
  -drop_scan_angle_between -25 -23
Filter points based on their gps time.
  -keep_gps_time 11.125 130.725
  -drop_gps_time_below 11.125
  -drop_gps_time_above 130.725
  -drop_gps_time_between 22.0 48.0
Filter points based on their wavepacket.
  -keep_wavepacket 0
  -drop_wavepacket 3
Filter points with simple thinning.
  -keep_every_nth 2
  -keep_random_fraction 0.1
  -thin_with_grid 1.0
Transform coordinates.
  -translate_x -2.5
  -scale_z 0.3048
  -rotate_xy 15.0 620000 4100000 (angle + origin)
  -translate_xyz 0.5 0.5 0
  -translate_then_scale_y -0.5 1.001
  -switch_x_y -switch_x_z -switch_y_z
  -clamp_z_below 70.5
  -clamp_z 70.5 72.5
Transform raw xyz integers.
  -translate_raw_z 20
  -translate_raw_xyz 1 1 0
  -clamp_raw_z 500 800
Transform intensity.
  -scale_intensity 2.5
  -translate_intensity 50
  -translate_then_scale_intensity 0.5 3.1
  -clamp_intensity 0 255
  -clamp_intensity_above 255
Transform scan_angle.
  -scale_scan_angle 1.944445
  -translate_scan_angle -5
  -translate_then_scale_scan_angle -0.5 2.1
Change the return number or return count of points.
  -repair_zero_returns
  -set_return_number 1
  -change_return_number_from_to 2 1
  -set_number_of_returns 2
  -change_number_of_returns_from_to 0 2
Modify the classification.
  -set_classification 2
  -change_classification_from_to 2 4
  -classify_z_below_as -5.0 7
  -classify_z_above_as 70.0 7
  -classify_z_between_as 2.0 5.0 4
  -classify_intensity_above_as 200 9
  -classify_intensity_below_as 30 11
Change the flags.
  -set_withheld_flag 0
  -set_synthetic_flag 1
  -set_keypoint_flag 0
Modify the user data.
  -set_user_data 0
  -change_user_data_from_to 23 26
Modify the point source ID.
  -set_point_source 500
  -change_point_source_from_to 1023 1024
  -quantize_Z_into_point_source 200
Transform gps_time.
  -translate_gps_time 40.50
  -adjusted_to_week
  -week_to_adjusted 1671
Transform RGB colors.
  -scale_rgb_down (by 256)
  -scale_rgb_up (by 256)
Supported LAS Inputs
  -i lidar.las
  -i lidar.laz
  -i lidar1.las lidar2.las lidar3.las -merged
  -i *.las - merged
  -i flight0??.laz flight1??.laz
  -i terrasolid.bin
  -i esri.shp
  -i nasa.qi
  -i lidar.txt -iparse xyzti -iskip 2 (on-the-fly from ASCII)
  -i lidar.txt -iparse xyzi -itranslate_intensity 1024
  -lof file_list.txt
  -stdin (pipe from stdin)
  -rescale 0.01 0.01 0.001
  -rescale_xy 0.01 0.01
  -rescale_z 0.01
  -reoffset 600000 4000000 0
Supported LAS Outputs
  -o lidar.las
  -o lidar.laz
  -o xyzta.txt -oparse xyzta (on-the-fly to ASCII)
  -o terrasolid.bin
  -o nasa.qi
  -odir C:\data\ground (specify output directory)
  -odix _classified (specify file name appendix)
  -ocut 2 (cut the last two characters from name)
  -olas -olaz -otxt -obin -oqfit (specify format)
  -stdout (pipe to stdout)
  -nil    (pipe to NULL)
LAStools (by martin@rapidlasso.com) version 140709
Supported ASCII Inputs:
  -i lidar.txt
  -i lidar.txt.gz
  -i lidar.zip
  -i lidar.rar
  -i lidar.7z
  -stdin (pipe from stdin)
usage:
txt2las -parse tsxyz -i lidar.txt.gz
txt2las -parse xyzairn -i lidar.zip -utm 17T -vertical_navd88 -olaz -set_class 2 -quiet
unzip -p lidar.zip | txt2las -parse xyz -stdin -o lidar.las -longlat -elevation_survey_feet
txt2las -i lidar.zip -parse txyzar -scale_scan_angle 57.3 -o lidar.laz
txt2las -skip 5 -parse xyz -i lidar.rar -set_file_creation 28 2011 -o lidar.las
txt2las -parse xyzsst -v -set_scale 0.001 0.001 0.001 -i lidar.txt
txt2las -parse xsysz -set_scale 0.1 0.1 0.01 -i lidar.txt.gz -sp83 OH_N -feet
las2las -parse tsxyzRGB -i lidar.txt -set_version 1.2 -scale_intensity 65535 -o lidar.las
txt2las -h
---------------------------------------------
The '-parse tsxyz' flag specifies how to interpret
each line of the ASCII file. For example, 'tsxyzssa'
means that the first number is the gpstime, the next
number should be skipped, the next three numbers are
the x, y, and z coordinate, the next two should be
skipped, and the next number is the scan angle.
The other supported entries are i - intensity,
n - number of returns of given pulse, r - number
of return, c - classification, u - user data, and
p - point source ID, e - edge of flight line flag, and
d - direction of scan flag, R - red channel of RGB
color, G - green channel, B - blue channel
---------------------------------------------
Other parameters are
'-set_scale 0.05 0.05 0.001'
'-set_offset 500000 2000000 0'
'-set_file_creation 67 2011'
'-set_system_identifier "Riegl 500,000 Hz"'
'-set_generating_software "LAStools"'
'-utm 14T'
'-sp83 CA_I -feet -elevation_survey_feet'
'-longlat -elevation_feet'

---------------

if you find bugs let me (martin.isenburg@rapidlasso.com) know.
