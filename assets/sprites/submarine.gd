extends Node2D

@export var speed = 20000;

var facingRight
# Called when the node enters the scene tree for the first time.
func _ready():
	facingRight = true
	$CharacterBody2D/AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movementX = Input.get_axis("left", "right")
	var movementY = Input.get_axis("up", "down")
	var movement = Vector2(movementX, movementY).normalized() * speed * delta
	if movement.x < 0 and facingRight == true:
		$CharacterBody2D/AnimatedSprite2D.flip_h = true;
		facingRight = false
	elif movement.x > 0 and facingRight == false:
		$CharacterBody2D/AnimatedSprite2D.flip_h = false;
		facingRight = true;
	$CharacterBody2D.velocity = movement;
	$CharacterBody2D.move_and_slide();
	print($CharacterBody2D.position);
