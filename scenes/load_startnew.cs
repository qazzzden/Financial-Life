using Godot;
using System;

public partial class load_startnew : Control
{
	public VBoxContainer loadscreen;
	public TextureButton load1;
	public TextureButton load2;
	public TextureButton load3;
	public TextureButton load4;
	public TextureButton load5;
	public Node loadi;
	public Node bgloadi;
	public AnimationPlayer anim;
	
	public TextureRect backgd;
	public TextureRect endgd;

	public override void _Ready()
	{
		backgd = GetNode<TextureRect>("Background");
		endgd = GetNode<TextureRect>("Ending");
		
		loadi = GetNode<Node>("/root/Loadingqazzz");
		bgloadi=GetNode<Node>("/root/Loadingscreenqazzz");
		
		loadscreen = GetNode<VBoxContainer>("Background/Load");
		load1 = GetNode<TextureButton>("Background/Load/1strow/VBoxContainer/ManLoadBtn1");
		load2 = GetNode<TextureButton>("Background/Load/1strow/VBoxContainer2/ManLoadBtn2");
		load3 = GetNode<TextureButton>("Background/Load/1strow/VBoxContainer3/ManLoadBtn3");
		load4 = GetNode<TextureButton>("Background/Load/1strow/VBoxContainer4/ManLoadBtn4");
		load5 = GetNode<TextureButton>("Background/Load/1strow/VBoxContainer5/ManLoadBtn5");
		loadscreen.Visible=false;
		anim = GetNode<AnimationPlayer>("Appear");
		
		Godot.TextureButton[] saves={load1,load2,load3,load4,load5};
		
		bgloadi.Call("backgroundhandler",backgd,endgd);
		
		for (int i = 1; i < 6; i++)
		{
			string bif = i.ToString();
			string construct = $"res://savingpictures/mansavepic{bif}.png";
			saves[i-1].TextureNormal=(Texture2D)GD.Load(construct);
		}
		
	}
	
	public override void _Process(double delta)
	{
	}

//Control buttons

private void _on_load_pressed()
{	
	if(loadscreen.Visible==true){
		anim.Play("easyout");
	}
	else{
		loadscreen.Visible=true;
		anim.Play("easyin");
	}
}

private void _on_menu_pressed()
{
	GetTree().ChangeSceneToFile("res://scenes/main_menu.tscn");
}

private void _on_newgame_pressed()
{
	loadi.Set("loads","none");
	loadi.Set("scener","res://scenes/game_load.tscn");
	GetTree().ChangeSceneToFile("res://scenes/loadinganim.tscn");
}

// LOAD BUTTONS
void _loadprocess(string data)
{
	loadi.Set("loads",data);
	loadi.Set("scener","res://scenes/game_load.tscn");
	GetTree().ChangeSceneToFile("res://scenes/loadinganim.tscn");
}

private void _on_man_load_btn_1_pressed()
{
	_loadprocess("1");
}

private void _on_man_load_btn_2_pressed()
{
	_loadprocess("2");
	// Replace with function body.
}


private void _on_man_load_btn_3_pressed()
{
	_loadprocess("3");
	// Replace with function body.
}


private void _on_man_load_btn_4_pressed()
{
	_loadprocess("4");
	// Replace with function body.
}


private void _on_man_load_btn_5_pressed()
{
	_loadprocess("5");
	// Replace with function body.
}

//end of main
}







