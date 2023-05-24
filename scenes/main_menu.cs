using Godot;
using System;




public partial class main_menu : Node
{
	public Node loadi;
	public Node bgloadi;
	
	public TextureRect backgd;
	public TextureRect endgd;
	

	public override void _Ready()
	{
		backgd = GetNode<TextureRect>("Background");
		endgd = GetNode<TextureRect>("Ending");
		
		loadi = GetNode<Node>("/root/Loadingqazzz");
		bgloadi=GetNode<Node>("/root/Loadingscreenqazzz");
		
		bgloadi.Call("backgroundhandler",backgd,endgd);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
private void _on_start_button_pressed()
{
	loadi.Set("scener","res://scenes/load_startnew.tscn");
	GetTree().ChangeSceneToFile("res://scenes/loadinganim.tscn");
}


private void _on_settings_button_pressed()
{
	GetTree().ChangeSceneToFile("res://scenes/settings.tscn");
}


private void _on_credits_pressed()
{
	GetTree().ChangeSceneToFile("res://scenes/credits.tscn");
}


private void _on_exit_button_pressed()
{
	GetTree().Quit();
}

//end of main
}



