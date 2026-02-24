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
            oascetic.visible=false;
            
        }break;
        case "anareply":{
            newtextbox("Anasuya:Even the vines respond to your care.\nNo wonder the forest thrives around you.");
            newtextbox("King Dushyanta (to himself):She stands like a forest deity ,\nuntouched by courtly artifice.");
            newtextbox("Shakuntala(annoyed):This bee will not leave me!\n It hums as though I were a blossom.");
            newtextbox("Priyamvada: Then perhaps some unseen hero will defend you.",0,["beereveal1:Step Forward Boldly","beereveal2:Step Forward Respectfully","beereveal3:observe Briefly"],true); 
        
        }
            break;
        case "beereveal1":{
            newtextbox("King Dushyanta: Fear Not, Even a small threat deserves protection. Thee bee is gone");
            newtextbox("Shakuntala:A king? Here? \n We did not know we were being observed");
            newtextbox("Anasuya(bowing):Forgive our informality your majesty");
            newtextbox("The messenger is here for you");
            
        }
            break;
        case "beereveal2":{
            newtextbox("King Dushyanta:Forgive the intrusion.\n\nI could not ignore distress, however small.\nThe bee will trouble you no longer.");
            newtextbox("Shakuntala: You show kindness beyond neccessity");
            newtextbox("Priyamvada:And she blushes beyond explanation")
            newtextbox("The messenger is here for you");
        }
            break;
        case "beereveal3":{
            newtextbox(" King Dushyanta:I should not have remained hidden.\nAllow me to correct that discourtesy");
            newtextbox("Shakuntala: You meant no harm?");
            newtextbox("King Dushyanta:None. I was struck by the peace here.");
            newtextbox("Anasuya:Then peace has found you as well.");
            newtextbox("The messenger is here for you");
        }
            
            break;
        
        case "duty1":{
            newtextbox("King Dushyanta: A king belongs first to his people.\nI will return immediately.");
            newtextbox("Shakuntala:So swiftly?");
            newtextbox("Priyamvada:Duty is a stern rival");
            newtextbox("press v to go to capital")
            }   
            break;
        case "duty2":{
            newtextbox("King Dushyanta:The summons comes too soon.\nYet I cannot deny obligation.");
            newtextbox("Anasuya :His words leave , his thoughts remain.");
            newtextbox("press v to go to capital")
        }
            break;
        case "duty3":{
            newtextbox("King Dushyanta:Inform the council I return at once.");
            newtextbox("Shakuntala :Will he remember this grove?");
            
            
        }
            break;
        case "vidu1":{
            newtextbox("King Dushyanta:The air was clearer there.\nIt lingers in memory. ");
            newtextbox("Vidushakha:Clear air does not trouble sleep, my friend. ",0,["res1:Return for protection.","res1:Return for her.","res1:Return under official pretext."],true);
        
        }break;
            case "vidu1":{
            newtextbox("King Dushyanta:I returned altered.\nSomething in that hermitage unsettled me. ");
            newtextbox("Vidushakha:. Unsettled or ...enchanted",0,["res1:Return for protection.","res1:Return for her.","res1:Return under official pretext."],true);
            
        }break;
        case "vidu1":{
            newtextbox("King Dushyanta:I met one whose presence commands thought.\nI cannot dismiss it. ");
            newtextbox("Vidushakha:Then your cure lies not in court, but forest.",0,["res1:Return for protection.","res1:Return for her.","res1:Return under official pretext."],true);
            
        }break;
        case "res1":{
            newtextbox("Vidusaka:Ah..so duty walks in now");
            newtextbox("press t to return to forest");
            
}        break;
        case "shakmon": {
            newtextbox("Shakuntala:Why does his absence disturb my thoughts?\nI had known peace before this meeting.\nNow even silence feels altered",0,["direct:Speak Directly","cautious:speak cautiously","ask:Ask Her feeling first"],true)
            }
          break;
        case "direct": {
            newtextbox("King:I will not disguise what binds my thoughts.\nMy heart has chosen you.");
            newtextbox("Shakuntala:Your words both steady and unsettle me.",0,["mar:..."],true);
        }break;
        case "mar":{
            newtextbox("King:Let our union be by mutual will alone.\nLet no delay stand between hearts already joined.");
            newtextbox("Priyamada&Anasuya:The forest itself consents. ");
        }    
        }        
        }   
    