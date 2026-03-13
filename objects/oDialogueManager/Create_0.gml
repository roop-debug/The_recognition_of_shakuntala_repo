// oDialogueManager - Create Event
// Persistent object - place once in your first room
show_debug_message("audio asset id: " + string(Hunting_scene_1));
global.DM = id;
forestVisitCount = 0;
activeChainKey = "";
// Add this line to oDialogueManager Create event alongside the others
pendingEndCallback = "";
activDialogueSound = -1;
isActive = false;
unlockPlayerTimer = 0;
friendsWalkTimer = 0; 
beeApproachTarget = "";   // which beereveal to fire
beeApproachActive = false;
beeRevealComplete = false;

// Build all dialogue data
global.dialogue = {};

// ─── HUNTING ───────────────────────────────────────────────
global.dialogue[$ "hunting_start"] = [
    {
        speaker: "Ascetic",
        text: "Stop, O King!\nThis creature lives under our protection.",
        bg: 0,
        audio: AsceticAct1D1
    },
    {
        speaker: "Ascetic",
        text: "The hermitage shelters the harmless.\nLay down your weapon in this sacred ground.",
        bg: 0,
        responses: [
            { label: "Lower the bow at once.", next: "hunting1" },
            { label: "Assert that hunting is a king's discipline.", next: "hunting2" },
            { label: "Ask why the forest is under protection.", next: "hunting3" }
        ]
    }
];
global.dialogue[$ "hunting1"] = [
    { speaker: "King Dushyanta", text: "You speak rightly.\nI will not disturb what seeks sanctuary.\nMy arrow returns to rest.", bg: 0, audio: Hunting_scene_1 },
    { speaker: "Ascetic",        text: "Your restraint honors your crown.\nPower governed by dharma is true kingship.", bg: 0, audio: AsceticAct1D2,onEnd: "hideAscetic"}
      
];

global.dialogue[$ "hunting2"] = [
    { speaker: "King Dushyanta", text: "The hunt sharpens judgment and steadies the hand.\nIt is no idle sport but preparation for rule.\nYet I will not violate sacred refuge.", bg: 0, audio:Hunting_scene_2},
    { speaker: "Ascetic",        text: "Discipline is noble, but compassion is greater still.\nA king who knows when not to strike is feared and revered alike.", bg: 0, audio: AsceticAct1D3,
      responses: [{ label: "Lower Bow", next: "0" }] },
    { speaker: "Ascetic",        text: "Enter then, not as hunter, but protector.", bg: 0, audio: AsceticAct1D4 ,onEnd: "hideAscetic",onEnd: "hideAscetic"}
];

global.dialogue[$ "hunting3"] = [
    { speaker: "King Dushyanta", text: "Tell me plainly, does all this grove stand under vow?", bg: 0, audio:Hunting_scene_3__i_ },
    { speaker: "Ascetic",        text: "Every creature here lives in trust.\nThis ground breathes peace by sacred promise.", bg: 0, audio: AsceticAct1D5 },
    { speaker: "King Dushyanta", text: "Then I would dishonor myself to disturb it.", bg: 0, audio: Hunting_scene_3__ii_ },
    { speaker: "Ascetic",        text: "May righteousness strengthen your reign.",bg: 0, audio: AsceticAct1D6,
      onEnd: "hideAscetic" }   // custom end flag - see advanceDialogue
];

// ─── FOREST SCENE ──────────────────────────────────────────
global.dialogue[$ "forest_start"] = [
{
    speaker: "Priyamvada",
    text: "The jasmine bends toward you, Shakuntala.\nIt clings as if fearing your absence.",
    bg: 0,
    audio: PriyamvadaACT1D1,
    responses:  [{label: "...", next: "anareply"}]
}
]

global.dialogue[$ "anareply"] = [
    { speaker: "Anasuya",        text: "Even the vines respond to your care.\nNo wonder the forest thrives around you.", bg: 0, audio: AnasuyaACT1D1 },
    { speaker: "King Dushyanta", text: "(to himself): She stands like a forest deity,\nuntouched by courtly artifice.", bg: 0, audio: Bee_incident_reveal_1 },
    { speaker: "Shakuntala",     text: "(annoyed): This bee will not leave me!\nIt hums as though I were a blossom.", bg: 0, audio: shakuntala_act1_no1 },
    {
        speaker: "Priyamvada",
        text: "Then perhaps some unseen hero will defend you.",
        bg: 0,
        audio: PriyamvadaACT1D2,
        responses: [
            { label: "Step Forward Boldly",       next: "approach_bold" },
            { label: "Step Forward Respectfully", next: "approach_respect" },
            { label: "Observe Briefly",           next: "approach_observe" }
        ]
    }
];
global.dialogue[$ "approach_bold"] = [
    { speaker: "", text: " ", bg: 0, onEnd: "approach_bold_cb" }
];

global.dialogue[$ "approach_respect"] = [
    { speaker: "", text: " ", bg: 0, onEnd: "approach_respect_cb" }
];

global.dialogue[$ "approach_observe"] = [
    { speaker: "", text: " ", bg: 0, onEnd: "approach_observe_cb" }
];

global.dialogue[$ "beereveal1"] = [
    { speaker: "King Dushyanta", text: "Fear not. Even a small threat deserves protection.\nThe bee is gone.", bg: 0, audio:Bee_incident_reveal_2 },
    { speaker: "Shakuntala",     text: "A king? Here?\nWe did not know we were being observed.", bg: 0, audio: shakuntala_act1_no2},
    { speaker: "Anasuya",        text: "(bowing): Forgive our informality, your majesty.", bg: 0, audio: AnasuyaACT1D2},
    { speaker: "",               text: "The messenger is here for you.", bg: 0, onEnd: "beeComplete" }
];

global.dialogue[$ "beereveal2"] = [
    { speaker: "King Dushyanta", text: "Forgive the intrusion.\nI could not ignore distress, however small.\nThe bee will trouble you no longer.", bg: 0, audio: Bee_incident_reveal_3},
    { speaker: "Shakuntala",     text: "You show kindness beyond necessity.", bg: 0, audio:shakuntala_act1_no3 },
    { speaker: "Priyamvada",     text: "And she blushes beyond explanation.", bg: 0, audio: PriyamvadaACT1D3 },
    { speaker: "",               text: "The messenger is here for you.", bg: 0 , onEnd: "beeComplete"}
];

global.dialogue[$ "beereveal3"] = [
    { speaker: "King Dushyanta", text: "I should not have remained hidden.\nAllow me to correct that discourtesy.", bg: 0, audio:Bee_incident_reveal_4 },
    { speaker: "Shakuntala",     text: "You meant no harm?", bg: 0, audio:shakuntala_act1_no4 },
    { speaker: "King Dushyanta", text: "None. I was struck by the peace here.", bg: 0, audio: Bee_incident___reveal_5 },
    { speaker: "Anasuya",        text: "Then peace has found you as well.", bg: 0, audio: AnasuyaACT1D3 },
    { speaker: "",               text: "The messenger is here for you.", bg: 0 , onEnd: "beeComplete"}
];

// ─── DUTY / DEPARTURE ──────────────────────────────────────
global.dialogue[$ "messenger_entry"] = [
{
    speaker: "Messenger",
    text: "Your Majesty, the council awaits.\nMatters of state cannot proceed without you.",
    bg: 0,
    audio: MessengerACT1D1,
    responses: [{label: "Duty must prevail", next: "duty1"}, {label: "Express reluctance", next: "duty2"}, {label: "Conceal your emotions", next: "duty3"}]
}
];

global.dialogue[$ "duty1"] = [
    { speaker: "King Dushyanta", text: "A king belongs first to his people.\nI will return immediately.", bg: 0, audio:Npc_calls_him_back_1 },
    { speaker: "Shakuntala",     text: "So swiftly?", bg: 0, audio:shakuntala_act1_no5 },
    { speaker: "Priyamvada",     text: "Duty is a stern rival.", bg: 0, audio: PriyamvadaACT1D4 },

];

global.dialogue[$ "duty2"] = [
    { speaker: "King Dushyanta", text: "The summons comes too soon.\nYet I cannot deny obligation.", bg: 0, audio: Npc_calls_him_back_2 },
    { speaker: "Anasuya",        text: "His words leave, his thoughts remain.", bg: 0, audio: AnasuyaACT1D4 },

];

global.dialogue[$ "duty3"] = [
    { speaker: "King Dushyanta", text: "Inform the council I return at once.", bg: 0, audio:Npc_calls_him_back_3 },
    { speaker: "Shakuntala",     text: "Will he remember this grove?", bg: 0, audio:shakuntala_act1_no6 }
];

// ─── VIDUSHAKA ─────────────────────────────────────────────
global.viduResponses = [
    { label: "Return for protection.",        next: "res1" },
    { label: "Return for her.",               next: "res1" },
    { label: "Return under official pretext.", next: "res1" }
];

global.dialogue[$ "vidu1"] = [
    { speaker: "King Dushyanta", text: "The air was clearer there.\nIt lingers in memory.", bg: 0, audio:Vidusaka_conversation_1 },
    { speaker: "Vidushaka",      text: "Clear air does not trouble sleep, my friend.", bg: 0, responses: global.viduResponses, audio:VidusakaAct1D2 }
];

global.dialogue[$ "vidu2"] = [
    { speaker: "King Dushyanta", text: "I returned altered.\nSomething in that hermitage unsettled me.", bg: 0, audio:Vidusaka_conversation_2 },
    { speaker: "Vidushaka",      text: "Unsettled or... enchanted?", bg: 0, responses: global.viduResponses, audio:VidusakaAct1D3 }
];

global.dialogue[$ "vidu3"] = [
    { speaker: "King Dushyanta", text: "I met one whose presence commands thought.\nI cannot dismiss it.", bg: 0, audio:Vidusaka_conversation_3 },
    { speaker: "Vidushaka",      text: "Then your cure lies not in court, but forest.", bg: 0, responses: global.viduResponses, audio:VidusakaAct1D4 }
];

global.dialogue[$ "res1"] = [
    { speaker: "Vidushaka", text: "Ah! So duty now walks in two directions.", bg: 0, audio:VidusakaAct1D5 ,onEnd: "fadeToForest" },
    
];


// ─── SHAKUNTALA MONOLOGUE ───────────────────────────────────
global.dialogue[$ "shakmon_entry"] = [
{
    speaker: "King Dushyanta (aside)",
    text: "The grove feels unchanged.\nIt is I who am restless.",
    bg: 0,
    audio: Return_to_hermitage,
    
    
},
    { 
        speaker: "Shakuntala(to herself)", 
        text: "Why does his absence disturb my thoughts?\nI had known peace before this meeting.\nNow even silence feels altered.", 
        bg: 0,
        audio: shakuntala_act1_no7}
      
      
];
global.dialogue[$ "confess"] = [
{
    speaker: "",
    text: "How do you wish to confess?",
    bg: 0,
    responses: [
          { label: "Speak Directly",         next: "direct" },
          { label: "Speak Cautiously",       next: "cautious" },
          { label: "Ask Her Feeling First",  next: "ask" }
    ]
}
    ];

global.dialogue[$ "direct"] = [
    { 
        speaker: "King", 
        text: "I will not disguise what binds my thoughts.\nMy heart has chosen you.", 
        bg: 0,
        audio: Confession_1, 
    },
    { 
        speaker: "Shakuntala", 
        text: "Your words both steady and unsettle me.", 
        bg: 0,
        audio: shakuntala_act1_no8,
        responses: [{ label: "...", next: "mar" }] 
    }
];

global.dialogue[$ "cautious"] = [
    {
        speaker: "King",
        text: "Since departing, I have known no rest.\nIt is best I speak plainly now..",
        bg: 0,
        audio: Confession_2
    },
    {
        speaker: "Shakuntala",
        text: "I feared my feelings stood alone.",
        bg: 0,
        audio: shakuntala_act1_no9,
        responses: [{label: "...", next: "mar"}]
    }
]

global.dialogue[$ "ask"] = [
{
    speaker: "King",
    text: "Tell me, did my absence weigh upon you?",
    bg: 0,
    audio: Confession_3
},
{
    speaker: "Shakuntala",
    text: "It did.",
    bg: 0,
    audio: shakuntala_act1_no10,
    responses: [{label: "...", next: "mar"}]
}
]

global.dialogue[$ "mar"] = [
    { 
        speaker: "King", 
        text: "Let our union be by mutual will alone.\nLet no delay stand between hearts already joined.", 
        bg: 0,
        audio: Confession_4, 
    },
    { 
        speaker: "Priyamvada & Anasuya", 
        text: "The forest itself consents.", 
        bg: 0,
        audio: Anasuya_priyamvadaACT1D1,
        onEnd: "walkInFriends"
    }
];

// ─── GANDHARVA MARRIAGE ────────────────────────────────────
global.dialogue[$ "gandharva"] = [
    {
        speaker: "Dushyanta",
        text: "This vow is ours, freely given.",
        bg: 0,
        audio: Gandharva_marriage_1
    },
    {
        speaker: "Shakuntala",
        text: "Then let the forest remember what we declare.",
        bg: 0,
		audio: shakuntala_act1_no11
    },
    {
        speaker: "Dushyanta",
        text: "This ring bears my seal.\nShould doubt arise, it will speak for me.",
        bg: 0,
		audio: Gandharva_marriage_2
    },
    {
        speaker: "Priyamvada",
        text: "A token binds memory to promise.",
        bg: 0,
        audio: PriyamvadaACT1D5,
        onEnd: "triggerDeparture"
    }
];

// ─── DUSHYANTA LEAVES ──────────────────────────────────────
global.dialogue[$ "departure"] = [
    {
        speaker: "",
        text: "You must now part ways.\nHow do you take your leave?",
        bg: 0,
        responses: [
            { label: "Promise swift return.",  next: "depart1" },
            { label: "Speak solemnly.",        next: "depart2" },
            { label: "Speak confidently.",     next: "depart3" }
        ]
    }
];

global.dialogue[$ "depart1"] = [
    {
        speaker: "King Dushyanta",
        text: "I will send for you soon.\nTrust my word.",
        bg: 0,
		audio: Dushyanta_leaves_1
		
    },
    {
        speaker: "Shakuntala",
        text: "I will hold to that promise.\nYet the forest will feel empty without you.\nDo not let memory fade where affection has taken root.",
        bg: 0,
		audio: shakuntala_act1_9_1_,
        onEnd: "kingDeparts"
    }
];

global.dialogue[$ "depart2"] = [
    {
        speaker: "King Dushyanta",
        text: "Time may intervene - but not intention.",
        bg: 0,
		audio: Dushyanta_leaves_2
    },
    {
        speaker: "Shakuntala",
        text: "I understand the burden you carry.\nStill, time can change even what feels certain.\nLet your intention remain stronger than absence.",
        bg: 0,
		audio: shakuntala_act1_9_2_,
        onEnd: "kingDeparts"
    }
];

global.dialogue[$ "depart3"] = [
    {
        speaker: "King Dushyanta",
        text: "What we begin here will endure beyond distance.",
        bg: 0,
		audio: Dushyanta_leaves_3,
    },
    {
        speaker: "Shakuntala",
        text: "Your confidence gives me strength.\nYet I am new to such partings.\nReturn before longing grows too heavy.",
        bg: 0,
		audio: shakuntala_act1_9_3_,
        onEnd: "kingDeparts"
    }
];

// ─── DURVASA CURSE ─────────────────────────────────────────
global.dialogue[$ "durvasa_curse"] = [
    {
        speaker: "Durvasa",
        text: "I stand before you, yet receive no greeting?",
        bg: 0,
        audio: DurvasaACT1D1
    },
    {
        speaker: "Durvasa",
        text: "Since you think only of another,\nthat man shall forget you entirely!",
        bg: 0,
        audio: DurvasaACT1D2
    },
    {
        speaker: "Anasuya",
        text: "Holy sir, she is newly married!",
        bg: 0,
        audio: AnasuyaACT1D5
    },
    {
        speaker: "Durvasa",
        text: "A token from him may restore remembrance.\nBut until then - oblivion.",
        bg: 0,
        audio: DurvasaACT1D3,
        onEnd: "act1End"
    }
];

global.dialogue[$ "court1"] = [
    {
        speaker: "Vidusaka",
        text: "You sit in court, yet stare at nothing.\nWas the forest so remarkable?",
        bg: 0,
        audio: VidusakaAct1D1,
        responses: [
            { label: "Dismiss lightly", next: "vidu1" },
            { label: "Admit Distraction", next: "vidu2" },
            { label: "Speak only", next: "vidu3" }
        ],
        onEnd: ""
    }
];
global.dialogue[$ "farewell_start"] = [
    { speaker: "Kanva",      text: "Daughter, the time has come.\nThe hermitage that sheltered you now entrusts you to your husband's house.\nRemember, patience in joy, dignity in sorrow.", bg: 0, audio: KanvaAct2D1 },
    { speaker: "Priyamvada", text: "The palace may glitter, but do not let it blind you.", bg: 0, audio: PriyamvadaACT2D1 },
    { speaker: "Anasuya",    text: "And if ever doubt rises, remember who you are.", bg: 0, audio: AnasuyaACT2D1 },
    {
        speaker: "Kanva",
        text: "Go not as one sent away,\nbut as one fulfilled.",
        bg: 0,
		audio: KanvaAct2D2,
        responses: [
            { label: "Thank Kanva sincerely.",               next: "farewell1" },
            { label: "Admit you feel unready.",              next: "farewell2" },
            { label: "Speak with steady confidence.",        next: "farewell3" },
            { label: "Ask if destiny can truly be trusted.", next: "farewell4" }
        ]
    }
];

global.dialogue[$ "farewell1"] = [
    { speaker: "Shakuntala", text: "Father, whatever strength I carry comes from this place.\nI will not let your faith in me fade.", bg: 0, audio: shakuntala_act2_no1 },
    { speaker: "Kanva",      text: "Then you go prepared.", bg: 0, audio: KanvaAct2D3 , onEnd: "beginJourney" }
];

global.dialogue[$ "farewell2"] = [
    { speaker: "Shakuntala", text: "I have never known a world beyond these trees.\nWhat if I falter there?", bg: 0, audio: shakuntala_act2_no2 },
    { speaker: "Kanva",      text: "Even trees bend before they stand firm.", bg: 0, audio: KanvaAct2D4, onEnd: "beginJourney" }
];

global.dialogue[$ "farewell3"] = [
    { speaker: "Shakuntala", text: "I go as wife to my rightful place.\nFear will not master me.", bg: 0, audio: shakuntala_act2_no3 },
    { speaker: "Priyamvada", text: "That is the courage we hoped to see.", bg: 0, audio: PriyamvadaACT2D2, onEnd: "beginJourney" }
];

global.dialogue[$ "farewell4"] = [
    { speaker: "Shakuntala", text: "Is destiny certain, Father?\nOr must it be fought for?", bg: 0, audio: shakuntala_act2_no4 },
    { speaker: "Kanva",      text: "Destiny tests before it rewards.", bg: 0, audio: KanvaAct2D5, onEnd: "beginJourney" }
];

// ─── 3. RIVER CROSSING — RING LOST ────────────────────────
global.dialogue[$ "ring_lost"] = [
    {
        speaker: "!!!!",
        text: "The ring is gone.",
        bg: 0,
        
        responses: [
            { label: "Panic openly.",                          next: "ring1" },
            { label: "Search frantically but silently.",       next: "ring2" },
            { label: "Force yourself to remain calm.",         next: "ring3" },
            { label: "Convince yourself it is not important.", next: "ring4" }
        ]
    }
];

global.dialogue[$ "ring1"] = [
    { speaker: "Shakuntala", text: "The ring, no...\nIt was here.\nIt cannot be gone!", bg: 0, audio: shakuntala_act2_no5 },
    { speaker: "Shakuntala", text: "How could I be so careless?\nThis was the proof of everything.", bg: 0, audio: shakuntala_act2_no6}
];

global.dialogue[$ "ring2"] = [
    { speaker: "Shakuntala", text: "It must have fallen near the bank...\nI will find it.", bg: 0, audio: shakuntala_act2_no7 },
    { speaker: "Shakuntala", text: "The current has taken it.", bg: 0, audio: shakuntala_act2_no8 }
];

global.dialogue[$ "ring3"] = [
    { speaker: "Shakuntala", text: "It is only a token.\nWhat we vowed was real.", bg: 0, audio: shakuntala_act2_no9 },
    { speaker: "Shakuntala", text: "Truth does not drown in water.", bg: 0, audio: shakuntala_act2_no10}
];

global.dialogue[$ "ring4"] = [
    { speaker: "Shakuntala", text: "The ring is gone...\nBut he will not need it.", bg: 0, audio: shakuntala_act2_no11},
    { speaker: "Shakuntala", text: "He will remember.", bg: 0, audio: shakuntala_act2_no12 }
];

// ─── 4. ARRIVAL AT THE CAPITAL ────────────────────────────
global.dialogue[$ "arrival"] = [
    {
        speaker: "Guard",
        text: "State your purpose.",
        bg: 0,
        audio: GuardACT2D1,
        responses: [
            { label: "Declare you are the queen.",           next: "arrival1" },
            { label: "Say you seek audience with the king.", next: "arrival2" },
            { label: "State you come from the hermitage.",   next: "arrival3" },
            { label: "Speak with quiet authority.",          next: "arrival4" }
        ]
    }
];

global.dialogue[$ "arrival1"] = [
    { speaker: "Shakuntala", text: "I am wife to King Dushyanta.\nAnnounce me.", bg: 0, audio: shakuntala_act2_no13 },
    { speaker: "Guard",      text: "You will wait while we inform the court.", bg: 0, audio: GuardACT2D2 }
];

global.dialogue[$ "arrival2"] = [
    { speaker: "Shakuntala", text: "I request audience with the king\non a matter of personal bond.", bg: 0, audio: shakuntala_act2_no14 },
    { speaker: "Guard",      text: "Very well. Remain here.", bg: 0, audio: GuardACT2D3 }
];

global.dialogue[$ "arrival3"] = [
    { speaker: "Shakuntala", text: "I come from Sage Kanva's hermitage.\nThe king once visited there.", bg: 0, audio: shakuntala_act2_no15 },
    { speaker: "Guard",      text: "The court will decide if that warrants entry.", bg: 0, audio: GuardACT2D4}
];

global.dialogue[$ "arrival4"] = [
    { speaker: "Shakuntala", text: "The king will recognize me.\nInform him I have arrived.", bg: 0, audio: shakuntala_act2_no16 },
    { speaker: "Guard",      text: "We shall see.", bg: 0, audio: GuardACT2D5 }
];

// ─── 5. COURT OF KING DUSHYANTA ───────────────────────────
global.dialogue[$ "court_entry"] = [
    { speaker: "Herald",    text: "A woman from the hermitage seeks audience.", bg: 0, audio: HeraldACT2D1 },
    {
        speaker: "Dushyanta",
        text: "Let her approach.",
        bg: 0,
        audio: Court_of_king_Dushyanta_1,
        responses: [
            { label: "Address him with affection.",      next: "court_act2_1" },
            { label: "Speak formally before the court.", next: "court_act2_2" },
            { label: "Declare your marriage clearly.",   next: "court_act2_3" },
            { label: "Test his memory first.",           next: "court_act2_4" }
        ]
    }
];

global.dialogue[$ "court_act2_1"] = [
    { speaker: "Shakuntala", text: "My lord...\nI stand before you as one joined to you in vow.", bg: 0, audio: shakuntala_act2_no17},
    { speaker: "Dushyanta",  text: "You speak as though we share history.", bg: 0, audio: Court_of_king_Dushyanta_2, onEnd: "proofDemanded" }
];

global.dialogue[$ "court_act2_2"] = [
    { speaker: "Shakuntala", text: "Your Majesty,\nbefore sacred ground we pledged ourselves.", bg: 0, audio: shakuntala_act2_no18 },
    { speaker: "Dushyanta",  text: "I recall no such pledge.", bg: 0, audio: Court_of_king_Dushyanta_3, onEnd: "proofDemanded" }
];

global.dialogue[$ "court_act2_3"] = [
    { speaker: "Shakuntala", text: "I am your lawful wife,\nunited by mutual consent in the hermitage.", bg: 0, audio: shakuntala_act2_no19 },
    { speaker: "Dushyanta",  text: "Such a claim demands proof.", bg: 0, audio: Court_of_king_Dushyanta_4, onEnd: "proofDemanded" }
];

global.dialogue[$ "court_act2_4"] = [
    { speaker: "Shakuntala", text: "Do you not remember the grove?\nThe day you set aside your bow?", bg: 0, audio: shakuntala_act2_no20 },
    { speaker: "Dushyanta",  text: "I remember no such intimacy.", bg: 0, audio: Court_of_king_Dushyanta_5, onEnd: "proofDemanded" }
];

// ─── 6. PROOF DEMANDED ────────────────────────────────────
global.dialogue[$ "proof_scene"] = [
    {
        speaker: "Dushyanta",
        text: "If I had made such vow,\nthere would be token or witness.\nProduce it.",
        bg: 0,
        audio: Proof_demanded_1,
        responses: [
            { label: "Explain the ring was lost.",        next: "proof1" },
            { label: "Appeal to his conscience.",         next: "proof2" },
            { label: "Stand firm despite lacking proof.", next: "proof3" },
            { label: "Accuse him of willful denial.",     next: "proof4" }
        ]
    }
];

global.dialogue[$ "proof1"] = [
    { speaker: "Shakuntala", text: "You gave me a ring bearing your seal.\nIt was lost upon the river.", bg: 0, audio: shakuntala_act2_no21 },
    { speaker: "Dushyanta",  text: "Convenient loss.", bg: 0, audio: Proof_demanded_2, onEnd: "finalRejection" }
];

global.dialogue[$ "proof2"] = [
    { speaker: "Shakuntala", text: "Search your own heart.\nWould I stand falsely before you?", bg: 0, audio: shakuntala_act2_no22 },
    { speaker: "Dushyanta",  text: "A king cannot rule by sentiment.", bg: 0, audio: Proof_demanded_3, onEnd: "finalRejection" }
];

global.dialogue[$ "proof3"] = [
    { speaker: "Shakuntala", text: "Whether you remember or not,\ntruth does not change.", bg: 0, audio: shakuntala_act2_no23 },
    { speaker: "Dushyanta",  text: "Conviction is not evidence.", bg: 0, audio: Proof_demanded_4, onEnd: "finalRejection" }
];

global.dialogue[$ "proof4"] = [
    { speaker: "Shakuntala", text: "You deny not me, but your own memory.", bg: 0, audio: shakuntala_act2_no24 },
    { speaker: "Dushyanta",  text: "I deny what cannot be proven.", bg: 0, audio: Proof_demanded_5, onEnd: "finalRejection" }
];

// ─── 7. FINAL REJECTION ───────────────────────────────────
global.dialogue[$ "rejection_scene"] = [
    {
        speaker: "Dushyanta",
        text: "Until proof stands before this court,\nI cannot acknowledge your claim.\nThe throne cannot bend to uncertainty.",
        bg: 0,
        audio: Final_rejection_1,
        responses: [
            { label: "Plead openly.",                    next: "rejection1" },
            { label: "Withdraw in wounded dignity.",     next: "rejection2" },
            { label: "Speak with restrained sorrow.",    next: "rejection3" },
            { label: "Issue a final warning of truth.",  next: "rejection4" }
        ]
    }
];

global.dialogue[$ "rejection1"] = [
    { speaker: "Shakuntala", text: "To be forgotten is harsher than exile.", bg: 0, audio: shakuntala_act2_no25 }
    ,{ speaker: "Dushyanta", text: "Escort her from the court.", bg: 0, audio: Final_rejection_2, onEnd: "act2End"}
];

global.dialogue[$ "rejection2"] = [
    { speaker: "Shakuntala", text: "I will not beg remembrance.", bg: 0, audio: shakuntala_act2_no26 }
    ,{ speaker: "Dushyanta", text: "Escort her from the court.", bg: 0, audio: Final_rejection_2, onEnd: "act2End"}
];

global.dialogue[$ "rejection3"] = [
    { speaker: "Shakuntala", text: "Time will reveal what you refuse to see.", bg: 0, audio: shakuntala_act2_no27 }
    ,{ speaker: "Dushyanta", text: "Escort her from the court.", bg: 0, audio: Final_rejection_2, onEnd: "act2End"}
];

global.dialogue[$ "rejection4"] = [
    { speaker: "Shakuntala", text: "Truth returns, even to those who reject it.", bg: 0, audio: shakuntala_act2_no28 }

    ,{ speaker: "Dushyanta", text: "Escort her from the court.", bg: 0, audio: Final_rejection_2, onEnd: "act2End"}
];

