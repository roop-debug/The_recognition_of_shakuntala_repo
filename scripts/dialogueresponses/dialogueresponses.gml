function dialogueresponses(){
///@arg response
    switch(argument0){
        case 0:
            break;
        case "hunting1": 
        {
            newtextbox("King Dushyanta:You speak rightly. \nI will not disturb what seeks sanctuary. \nMy arrow returns to rest.",0);
            newtextbox("Ascetic:Your restraint honors your crown. \nPower governed by dharma is true kingship.",0,["0:..."]);
        }
            break;
        case "hunting2":  {
            newtextbox("King Dushyanta:The hunt sharpens judgment and steadies the hand.\nIt is no idle sport but preparation for rule.\nYet I will not violate sacred refuge.",0);
           newtextbox("Ascetic:Discipline is noble, but compassion is greater still.A king who knows when not to strike is feared and revered alike.",0,["0:Lower Bow"] );
            newtextbox("Ascetic:Enter then, not as hunter, but protector",0);
    }
            break;
        case "hunting3":{
            newtextbox("King Dushyanta:Tell me plainly , does all this grove stand under vow?\n ",0);
            newtextbox("Ascetic:Every creature here lives in trust. This ground breathes peace by sacred promise.");
            newtextbox("King Dushyanta:Then I would dishonor myself to disturb it.");
            newtextbox("Ascetic:May righteousness strengthen your reign");
           
            
        }break;
        case "anareply":{
            newtextbox("Anasuya:Even the vines respond to your care.\nNo wonder the forest thrives around you.");
            newtextbox("King Dushyanta (to himself):She stands like a forest deity ,\nuntouched by courtly artifice.");
            newtextbox("Shakuntala(annoyed):This bee will not leave me!\n It hums as though I were a blossom.");
            newtextbox("Priyamvada: Then perhaps some unseen hero will defend you.",0,["beereveal1:Step Forward Boldly","beereveal2:Step Forward Respectfully","beereveal3:observe Briefly"]); 
        
        }
            break;
        case "beereveal1":{
            newtextbox("King Dushyanta: Fear Not, Even a small threat deserves protection. Thee bee is gone");
            newtextbox("Shakuntala:A king? Here? \n We did not know we were being observed");
            newtextbox("Anasuya(bowing):Forgive our informality your majesty");
            messenger.path= [[x+32,y],[x+32,y]]
            
        }
            break;
        case "beereveal2":{
            newtextbox("King Dushyanta:Forgive the intrusion.\n\nI could not ignore distress, however small.\nThe bee will trouble you no longer.");
            newtextbox("Shakuntala: You show kindness beyond neccessity");
            newtextbox("Priyamvada:And she blushes beyond explanation")
            messenger.path= [[x+32,y],[x+32,y]]
        }
            break;
        case "beereveal3":{
            newtextbox(" King Dushyanta:I should not have remained hidden.\nAllow me to correct that discourtesy");
            newtextbox("Shakuntala: You meant no harm?");
            newtextbox("King Dushyanta:None. I was struck by the peace here.");
            newtextbox("Anasuya:Then peace has found you as well.");
            messenger.path= [[x+32,y],[x+32,y]]
        }
            break;
    }
        
}         