function scrAmbience(sound) {
    if (audio_is_playing(sound)) exit;
    var _s = audio_play_sound(sound, 10, true);
    audio_sound_gain(_s, 0.4, 0); // 40% volume, instant
}