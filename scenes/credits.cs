using Godot;
using System;


public partial class credits : Control
{
	
	public AnimationPlayer anim;
	
	public override void _Ready()
	{
		anim = GetNode<AnimationPlayer>("ColorRect/Creditos");
		anim.Play("Ttilemove");
	}

	public override void _Process(double delta)
	{
		
	}
	
	private void _on_menu_pressed()
	{
		GetTree().ChangeSceneToFile("res://scenes/main_menu.tscn");
	}
}


