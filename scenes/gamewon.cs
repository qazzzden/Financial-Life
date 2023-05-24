using Godot;
using System;

public partial class gamewon : Control
{
	public Node bgloadi;
	
	public TextureRect backgd;
	public TextureRect endgd;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		backgd = GetNode<TextureRect>("Background");
		endgd = GetNode<TextureRect>("Ending");
		
		bgloadi=GetNode<Node>("/root/Loadingscreenqazzz");
		
		bgloadi.Call("backgroundhandler",backgd,endgd);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	private void _on_menu_pressed()
	{
		GetTree().ChangeSceneToFile("res://scenes/main_menu.tscn");
	}	

private void _on_credits_pressed()
{
	GetTree().ChangeSceneToFile("res://scenes/credits.tscn");
}

//END OF MAIN
}






