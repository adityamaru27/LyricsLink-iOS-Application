# LyricsLink-iOS-Application

Developed an iOS application LyricsLink, using Swoft 2.0 which allows the user to search for songs using words from its lyrics using an API call to MusixMatch.
Linked the results which were mined using JSON Parsing, to the Spotify API which allows the user to preview the song, and finally integrated OAUTH 2.0 authorization to access and modify user’s playlist remotely.
The application coordinates 5 UIView Controllers and 2 UITableViewControllers via segues and has an NSGestureRecognizer function (long press) to facilitate the modification of the user's playlist. 

# Flow

1. User provides authentication, to allow the application to modify peorsonal information
2. User enters the lyrics of the sog
3. A table of the closest matches appears
4. User can preview the songs and subsequently choose which song they were looking for
5. Using OAUTH 2.0 the script then asks the user for Spotify credentials, to remotely access their playlists
6. The user selects playlist and the song is successfully added!

# Screenshots


<img src="https://cloud.githubusercontent.com/assets/16407832/15184801/aa3138e2-1764-11e6-8c81-852d6a60a0aa.jpg"  hspace = 50px width="200">
<img src="https://cloud.githubusercontent.com/assets/16407832/15184801/aa3138e2-1764-11e6-8c81-852d6a60a0aa.jpg" hspace = 50px width="200">
<img src="https://cloud.githubusercontent.com/assets/16407832/15184798/aa21e7d4-1764-11e6-8afb-2de165e7cb40.jpg" width="200" style="PADDING-RIGHT: 100px" hspace = 50px>
<img src="https://cloud.githubusercontent.com/assets/16407832/15184800/aa2f4f1e-1764-11e6-9bed-6b409fd12017.jpg" width="200" style="PADDING-RIGHT: 100px" hspace = 50px>
<img src="https://cloud.githubusercontent.com/assets/16407832/15184797/aa2095d2-1764-11e6-8c15-8906990e02f0.jpg" width="200" style="PADDING-RIGHT: 100px" hspace = 50px>
<img src="https://cloud.githubusercontent.com/assets/16407832/15184795/aa1fb61c-1764-11e6-95eb-d584c930d69e.jpg" width="200" style="PADDING-RIGHT: 100px" hspace = 50px>
<img src="https://cloud.githubusercontent.com/assets/16407832/15184796/aa1ffc08-1764-11e6-9c3a-ba515a265ef7.jpg" width="200" style="PADDING-RIGHT: 100px" hspace = 50px>
<img src="https://cloud.githubusercontent.com/assets/16407832/15184794/aa1f8caa-1764-11e6-8ba6-9cf0e7b98fc9.jpg" width="200" style="PADDING-RIGHT: 100px" hspace = 50px>
