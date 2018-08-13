extends KinematicBody2D

var Bullet = preload("res://Bullet2.tscn")
var speed = 100
var velocity = Vector2()
var rotSpeed = 0.05

func get_input():
    # add these actions in Project Settings -> Input Map
    velocity = Vector2()
    if Input.is_action_pressed('ui_down'):
        velocity = Vector2(-speed/3, 0).rotated(rotation)
    if Input.is_action_pressed('ui_up'):
        velocity = Vector2(speed, 0).rotated(rotation)
    if Input.is_action_pressed('ui_left'):
        rotation-=rotSpeed
    if Input.is_action_pressed('ui_right'):
        rotation+=rotSpeed
    if Input.is_action_just_pressed('ui_select'):
        shoot()
    if Input.is_action_pressed('ui_page_up'):
        print("Zoom up to "+str($Camera2D.zoom))
        $Camera2D.zoom-=Vector2(0.1,0.1)
    if Input.is_action_pressed('ui_page_down'):
        $Camera2D.zoom+=Vector2(0.1,0.1)
        print("Zoom down to "+str($Camera2D.zoom))

func shoot():
    # "Muzzle" is a Position2D placed at the barrel of the gun
    var b = Bullet.instance()
    b.start($Muzzle.global_position, rotation)
    get_parent().add_child(b)

func _physics_process(delta):
    get_input()
    #var dir = get_global_mouse_position() - global_position
    # Don't move if too close to the mouse pointer
    #if dir.length() > 5:
    #    rotation = dir.angle()
    velocity = move_and_slide(velocity)