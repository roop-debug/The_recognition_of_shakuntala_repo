// Credits list — change these 5 names to your actual names
credits = [
    "Roop Chakraborty",
    "Aarya Jaiswal",
    "Hiten Makhija As ",
    "Shail Ghaywat As King Dushyanta",
    "Sarvesh Bandi As Sage Kanva"
];

scrollY    = RESOLUTION_H;           // starts below screen
scrollSpeed = 0.5;
done       = false;
theEndAlpha = 0;

// total scroll distance: space each name 30px apart
creditSpacing = 30;
totalHeight   = array_length(credits) * creditSpacing;