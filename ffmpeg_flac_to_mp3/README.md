# This script turns flac files into high quality mp3 files on windows. Recursively inside folder system.

convert_flac_to_mp3.bat "C:\Path\To\Your\Music"

convert_flac_to_mp3.bat → runs in current folder, keeps .flac.

convert_flac_to_mp3.bat "D:\Music" → runs in D:\Music, keeps .flac.

convert_flac_to_mp3.bat "D:\Music" --delete-original → runs in D:\Music, removes .flac after conversion.
