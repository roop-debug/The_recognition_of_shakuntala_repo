if (keyboard_check_pressed(vk_space))
{
    dialogueStep++;

    if (dialogueStep >= dialogueLength)
    {
        room_goto(rCourtroom);
    }
}