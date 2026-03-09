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
    { speaker: "Ascetic",        text: "Your restraint honors your crown.\nPower governed by dharma is true kingship.", bg: 0, audio: AsceticAct1D2}
      
];

global.dialogue[$ "hunting2"] = [
    { speaker: "King Dushyanta", text: "The hunt sharpens judgment and steadies the hand.\nIt is no idle sport but preparation for rule.\nYet I will not violate sacred refuge.", bg: 0, audio:Hunting_scene_2},
    { speaker: "Ascetic",        text: "Discipline is noble, but compassion is greater still.\nA king who knows when not to strike is feared and revered alike.", bg: 0, audio: AsceticAct1D3,
      responses: [{ label: "Lower Bow", next: "0" }] },
    { speaker: "Ascetic",        text: "Enter then, not as hunter, but protector.", bg: 0, audio: AsceticAct1D4 }
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
    { speaker: "Anasuya",        text: "Even the vines respond to your care.\nNo wonder the forest thrives around you.", bg: 0, audio: AnasuyaACT1D1},
    { speaker: "King Dushyanta", text: "(to himself): She stands like a forest deity,\nuntouched by courtly artifice.", bg: 0, audio:Bee_incident_reveal_1 },
    { speaker: "Shakuntala",     text: "(annoyed): This bee will not leave me!\nIt hums as though I were a blossom.", bg: 0, audio: shakuntala_act1_no1 },
    { speaker: "Priyamvada",
        text: "Then perhaps some unseen hero will defend you.", 
        bg: 0, 
        audio: PriyamvadaACT1D2,
        responses: [
            { label: "Step Forward Boldly", next: "beereveal1" },
            { label: "Step Forward Respectfully", next: "beereveal2" },
            {  label: "Observe Briefly", next: "beereveal3" }
      ]}
];

global.dialogue[$ "beereveal1"] = [
    { speaker: "King Dushyanta", text: "Fear not. Even a small threat deserves protection.\nThe bee is gone.", bg: 0, audio:Bee_incident_reveal_2 },
    { speaker: "Shakuntala",     text: "A king? Here?\nWe did not know we were being observed.", bg: 0, audio: shakuntala_act1_no2},
    { speaker: "Anasuya",        text: "(bowing): Forgive our informality, your majesty.", bg: 0, audio: AnasuyaACT1D2},
    { speaker: "",               text: "The messenger is here for you.", bg: 0 }
];

global.dialogue[$ "beereveal2"] = [
    { speaker: "King Dushyanta", text: "Forgive the intrusion.\nI could not ignore distress, however small.\nThe bee will trouble you no longer.", bg: 0, audio: Bee_incident_reveal_3},
    { speaker: "Shakuntala",     text: "You show kindness beyond necessity.", bg: 0, audio:shakuntala_act1_no3 },
    { speaker: "Priyamvada",     text: "And she blushes beyond explanation.", bg: 0, audio: PriyamvadaACT1D3 },
    { speaker: "",               text: "The messenger is here for you.", bg: 0 }
];

global.dialogue[$ "beereveal3"] = [
    { speaker: "King Dushyanta", text: "I should not have remained hidden.\nAllow me to correct that discourtesy.", bg: 0, audio:Bee_incident_reveal_4 },
    { speaker: "Shakuntala",     text: "You meant no harm?", bg: 0, audio:shakuntala_act1_no4 },
    { speaker: "King Dushyanta", text: "None. I was struck by the peace here.", bg: 0 },//no audio file for this
    { speaker: "Anasuya",        text: "Then peace has found you as well.", bg: 0, audio: AnasuyaACT1D3 },
    { speaker: "",               text: "The messenger is here for you.", bg: 0 }
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
    { speaker: "Vidushaka", text: "Ah! So duty now walks in two directions.", bg: 0, audio:VidusakaAct1D5  },
    { speaker: "",          text: "Press T to return to the forest.", bg: 0, onEnd: "fadeToForest" }
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
    speaker: "How do you wish to confess?",
    text: "",
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
        bg: 0
    },
    {
        speaker: "Dushyanta",
        text: "This ring bears my seal.\nShould doubt arise, it will speak for me.",
        bg: 0
    },
    {
        speaker: "Priyamvada",
        text: "A token binds memory to promise.",
        bg: 0,
        audio: Gandharva_marriage_2,
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
        bg: 0
    },
    {
        speaker: "Shakuntala",
        text: "I will hold to that promise.\nYet the forest will feel empty without you.\nDo not let memory fade where affection has taken root.",
        bg: 0,
        audio: shakuntala_act1_no11,
        onEnd: "kingDeparts"
    }
];

global.dialogue[$ "depart2"] = [
    {
        speaker: "King Dushyanta",
        text: "Time may intervene — but not intention.",
        bg: 0
    },
    {
        speaker: "Shakuntala",
        text: "I understand the burden you carry.\nStill, time can change even what feels certain.\nLet your intention remain stronger than absence.",
        bg: 0,
        onEnd: "kingDeparts"
    }
];

global.dialogue[$ "depart3"] = [
    {
        speaker: "King Dushyanta",
        text: "What we begin here will endure beyond distance.",
        bg: 0
    },
    {
        speaker: "Shakuntala",
        text: "Your confidence gives me strength.\nYet I am new to such partings.\nReturn before longing grows too heavy.",
        bg: 0,
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
        bg: 0
    },
    {
        speaker: "Durvasa",
        text: "A token from him may restore remembrance.\nBut until then — oblivion.",
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

