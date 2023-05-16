using Godot;
using System;

public partial class loadinganim : Control
{
	
	public AnimationPlayer anim;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		anim = GetNode<AnimationPlayer>("LoadingProcess");
		anim.Play("blackout");
		GetTree().ChangeSceneToFile("res://scenes/game.tscn");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
