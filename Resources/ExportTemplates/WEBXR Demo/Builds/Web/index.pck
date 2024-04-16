GDPC                �                                                                         T   res://.godot/exported/133200997/export-0c3a4aeef0cdae56f2040152015d6c2f-VRmain.scn  `O      �      z�����E��֚Y���    T   res://.godot/exported/133200997/export-2536b1b7e042adb5c812cf50bdd56835-noismat.res ;             5`����(:�"��    X   res://.godot/exported/133200997/export-7ae615a41a15248698056fc81fadcabd-noismatbw.res   0?            ��nj��{����U�    T   res://.godot/exported/133200997/export-a8adf21a0f28c94c8c76a52d52f082b5-ARmain.scn  �      �      �^�U{���5;�cf#-    P   res://.godot/exported/133200997/export-f46c71a9b7f0892a5bf2bd9cf0943875-ball.scn�      �      (���V^�:��%�t    ,   res://.godot/global_script_class_cache.cfg  @e             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex`-      �      �̛�*$q�*�́        res://.godot/uid_cache.bin   i      �      �kxhV�\��8�]��*V       res://ARmain.gd         �      �h�-�㙧"�T}���       res://ARmain.tscn.remap c      c       RX�gJ����X4_��j       res://BallSpawner.gd0+      $      ��#��9��Ӂ�0�       res://VRmain.gd @C            ���%��ͮ� �k�3�       res://VRmain.tscn.remap �d      c       ���K�	��c�I��	P       res://ball.tscn.remap   �c      a       ;�#$�#ui�+�9KY)       res://ballMover.gd  @*      �       �W���0mIH�E��,�       res://icon.svg  `e      �      C��=U���^Qu��U3       res://icon.svg.import   @:      �       "u�b�k��M�`G¥<       res://noismat.tres.remap�c      d       �>��0E��z��G�       res://noismatbw.tres.remap  `d      f       a\�o�Ypok��Ԏ�       res://project.binary k      �      �i���� ̲(���R                extends Node3D

var webxr_interface
var vr_supported = false

func _ready():
	# We assume this node has a button as a child.
	# This button is for the user to consent to entering immersive VR mode.
	$CanvasLayer/Button.pressed.connect(self._on_button_pressed)

	webxr_interface = XRServer.find_interface("WebXR")
	if webxr_interface:
		# WebXR uses a lot of asynchronous callbacks, so we connect to various
		# signals in order to receive them.
		webxr_interface.session_supported.connect(self._webxr_session_supported)
		webxr_interface.session_started.connect(self._webxr_session_started)
		webxr_interface.session_ended.connect(self._webxr_session_ended)
		webxr_interface.session_failed.connect(self._webxr_session_failed)

		# This returns immediately - our _webxr_session_supported() method
		# (which we connected to the "session_supported" signal above) will
		# be called sometime later to let us know if it's supported or not.
		webxr_interface.is_session_supported("immersive-ar")

func _webxr_session_supported(session_mode, supported):
	if session_mode == 'immersive-ar':
		vr_supported = supported

func _on_button_pressed():
	if not vr_supported:
		OS.alert("Your browser doesn't support VR")
		return

	# We want an immersive VR session, as opposed to AR ('immersive-ar') or a
	# simple 3DoF viewer ('viewer').
	webxr_interface.session_mode = 'immersive-ar'
	# 'bounded-floor' is room scale, 'local-floor' is a standing or sitting
	# experience (it puts you 1.6m above the ground if you have 3DoF headset),
	# whereas as 'local' puts you down at the XROrigin.
	# This list means it'll first try to request 'bounded-floor', then
	# fallback on 'local-floor' and ultimately 'local', if nothing else is
	# supported.
	webxr_interface.requested_reference_space_types = 'bounded-floor, local-floor, local'
	# In order to use 'local-floor' or 'bounded-floor' we must also
	# mark the features as required or optional.
	webxr_interface.required_features = 'local-floor'
	webxr_interface.optional_features = 'bounded-floor'

	# This will return false if we're unable to even request the session,
	# however, it can still fail asynchronously later in the process, so we
	# only know if it's really succeeded or failed when our
	# _webxr_session_started() or _webxr_session_failed() methods are called.
	if not webxr_interface.initialize():
		OS.alert("Failed to initialize")
		return

func _webxr_session_started():
	$CanvasLayer.visible = false
	# This tells Godot to start rendering to the headset.
	get_viewport().use_xr = true
	# This will be the reference space type you ultimately got, out of the
	# types that you requested above. This is useful if you want the game to
	# work a little differently in 'bounded-floor' versus 'local-floor'.
	print ("Reference space type: " + webxr_interface.reference_space_type)
		
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	webxr_interface.start_passthrough()
	get_viewport().transparent_bg = true

func _webxr_session_ended():
	$CanvasLayer.visible = true
	# If the user exits immersive mode, then we tell Godot to render to the web
	# page again.
	get_viewport().use_xr = false

func _webxr_session_failed(message):
	OS.alert("Failed to initialize: " + message)
          RSRC                    PackedScene            ��������                                            r      resource_local_to_scene    resource_name    sky_top_color    sky_horizon_color 
   sky_curve    sky_energy_multiplier 
   sky_cover    sky_cover_modulate    ground_bottom_color    ground_horizon_color    ground_curve    ground_energy_multiplier    sun_angle_max 
   sun_curve    use_debanding    script    sky_material    process_mode    radiance_size    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction 	   _bundled       Script    res://ARmain.gd ��������   $   local://ProceduralSkyMaterial_0dby4 �
         local://Sky_q47tl ?         local://Environment_d7l6i c         local://PackedScene_63mjb �         ProceduralSkyMaterial          �p%?;�'?F�+?  �?	      �p%?;�'?F�+?  �?         Sky                          Environment                                               !                  PackedScene    q      	         names "         Main    script    Node3D    WorldEnvironment    environment    XROrigin3D    XRCamera3D 
   transform    CanvasLayer    Button    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    text    DirectionalLight3D 	   CSGBox3D    	   variants    	                           �?              �?              �?      �?               �?         	   EnterXR
      �?            1�;�  �?      ��1�;�       @         �?              �?              �?      �?  @�      node_count             nodes     N   ��������       ����                            ����                           ����                     ����                           ����               	   	   ����   
                                                      ����                           ����                   conn_count              conns               node_paths              editable_instances              version             RSRC     RSRC                    PackedScene            ��������                                            n      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script 	   _bundled       Script    res://ballMover.gd ��������
   Texture2D    res://noismatbw.tres ^dW�_4K
   Texture2D    res://noismat.tres !��x �!-   !   local://StandardMaterial3D_4amvk m
         local://PackedScene_c48g5 �         StandardMaterial3D                   ���>q�>��?��?        �?                           ƿ??���>���>  �?                       !         #            (         +            /         4         9            ;         =         l         PackedScene    m      	         names "         Ball    script    Node3D    CSGSphere3D    radius    radial_segments    rings 	   material    	   variants                    P��=   @                   node_count             nodes        ��������       ����                            ����                                     conn_count              conns               node_paths              editable_instances              version       l      RSRC        extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
 extends Node3D

const BALL = preload("res://ball.tscn")
@onready var left_controller = $"../XROrigin3D/LeftController"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_left_controller_button_released(name):
	$Label3D.text = name
	if name == "trigger_click":
		var new_ball = BALL.instantiate()
		new_ball.position = left_controller.position
		add_child(new_ball)
            GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dq716fl66h4pi"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                RSRC                    NoiseTexture2D            ��������                                            $      resource_local_to_scene    resource_name    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    script    width    height    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise           local://FastNoiseLite_xdj75 �         local://NoiseTexture2D_o26ue �         FastNoiseLite          )\�<         NoiseTexture2D                      #                   RSRC               RSRC                    NoiseTexture2D            ��������                                            $      resource_local_to_scene    resource_name    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    script    width    height    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise           local://FastNoiseLite_xdj75 �         local://NoiseTexture2D_eo0x5 �         FastNoiseLite          )\�<         NoiseTexture2D             #                   RSRC           

extends Node3D

var webxr_interface
var vr_supported = false

func _ready():
	# We assume this node has a button as a child.
	# This button is for the user to consent to entering immersive VR mode.
	$CanvasLayer/Button.pressed.connect(self._on_button_pressed)

	webxr_interface = XRServer.find_interface("WebXR")
	if webxr_interface:
		# WebXR uses a lot of asynchronous callbacks, so we connect to various
		# signals in order to receive them.
		webxr_interface.session_supported.connect(self._webxr_session_supported)
		webxr_interface.session_started.connect(self._webxr_session_started)
		webxr_interface.session_ended.connect(self._webxr_session_ended)
		webxr_interface.session_failed.connect(self._webxr_session_failed)

		# This returns immediately - our _webxr_session_supported() method
		# (which we connected to the "session_supported" signal above) will
		# be called sometime later to let us know if it's supported or not.
		webxr_interface.is_session_supported("immersive-vr")

func _webxr_session_supported(session_mode, supported):
	if session_mode == 'immersive-vr':
		vr_supported = supported

func _on_button_pressed():
	if not vr_supported:
		OS.alert("Your browser doesn't support VR")
		return

	# We want an immersive VR session, as opposed to AR ('immersive-ar') or a
	# simple 3DoF viewer ('viewer').
	webxr_interface.session_mode = 'immersive-vr'
	# 'bounded-floor' is room scale, 'local-floor' is a standing or sitting
	# experience (it puts you 1.6m above the ground if you have 3DoF headset),
	# whereas as 'local' puts you down at the XROrigin.
	# This list means it'll first try to request 'bounded-floor', then
	# fallback on 'local-floor' and ultimately 'local', if nothing else is
	# supported.
	webxr_interface.requested_reference_space_types = 'bounded-floor, local-floor, local'
	# In order to use 'local-floor' or 'bounded-floor' we must also
	# mark the features as required or optional.
	webxr_interface.required_features = 'local-floor'
	webxr_interface.optional_features = 'bounded-floor'

	# This will return false if we're unable to even request the session,
	# however, it can still fail asynchronously later in the process, so we
	# only know if it's really succeeded or failed when our
	# _webxr_session_started() or _webxr_session_failed() methods are called.
	if not webxr_interface.initialize():
		OS.alert("Failed to initialize")
		return

func _webxr_session_started():
	$CanvasLayer.visible = false
	# This tells Godot to start rendering to the headset.
	get_viewport().use_xr = true
	# This will be the reference space type you ultimately got, out of the
	# types that you requested above. This is useful if you want the game to
	# work a little differently in 'bounded-floor' versus 'local-floor'.
	print ("Reference space type: " + webxr_interface.reference_space_type)

func _webxr_session_ended():
	$CanvasLayer.visible = true
	# If the user exits immersive mode, then we tell Godot to render to the web
	# page again.
	get_viewport().use_xr = false

func _webxr_session_failed(message):
	OS.alert("Failed to initialize: " + message)
         RSRC                    PackedScene            ��������                                            ~      ..    LeftController    resource_local_to_scene    resource_name    sky_top_color    sky_horizon_color 
   sky_curve    sky_energy_multiplier 
   sky_cover    sky_cover_modulate    ground_bottom_color    ground_horizon_color    ground_curve    ground_energy_multiplier    sun_angle_max 
   sun_curve    use_debanding    script    sky_material    process_mode    radiance_size    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    size    subdivide_width    subdivide_height    subdivide_depth 	   _bundled       Script    res://VRmain.gd ��������   Script    res://BallSpawner.gd ��������   $   local://ProceduralSkyMaterial_0dby4 �         local://Sky_q47tl L         local://Environment_d7l6i p         local://BoxMesh_25rfi �         local://PackedScene_rbrld �         ProceduralSkyMaterial          �p%?;�'?F�+?  �?      �p%?;�'?F�+?  �?         Sky                          Environment                   ��`=	�|>���>                #                  BoxMesh    y      ���=���=���=         PackedScene    }      	         names "         Main    script    Node3D    WorldEnvironment    environment    XROrigin3D    XRCamera3D 
   transform    LeftController    tracker    XRController3D    MeshInstance3D    mesh    RightController    MeshInstance3D2 	   skeleton    CanvasLayer    Button    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    text    DirectionalLight3D    BallSpawner    Label3D $   _on_left_controller_button_released    button_released    	   variants                               �?              �?              �?      �?         �?              �?              �?  ��        ,   
   left_hand               �?              �?              �?  �?        ,      right_hand                             �?         	   EnterXR
      �?            1�;�  �?      ��1�;�       @                  �?              �?              �?    �x?7Uw�      node_count             nodes     �   ��������       ����                            ����                           ����                     ����                    
      ����         	                       ����                    
      ����         	                       ����                                 ����                     ����      	      
      
                                       ����                           ����                          ����                   conn_count             conns                                     node_paths              editable_instances              version             RSRC             [remap]

path="res://.godot/exported/133200997/export-a8adf21a0f28c94c8c76a52d52f082b5-ARmain.scn"
             [remap]

path="res://.godot/exported/133200997/export-f46c71a9b7f0892a5bf2bd9cf0943875-ball.scn"
               [remap]

path="res://.godot/exported/133200997/export-2536b1b7e042adb5c812cf50bdd56835-noismat.res"
            [remap]

path="res://.godot/exported/133200997/export-7ae615a41a15248698056fc81fadcabd-noismatbw.res"
          [remap]

path="res://.godot/exported/133200997/export-0c3a4aeef0cdae56f2040152015d6c2f-VRmain.scn"
             list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ���XX�"   res://Builds/Web/index.144x144.png��<��]x"   res://Builds/Web/index.180x180.png��i�Y&f"   res://Builds/Web/index.512x512.png��R�+�+   res://Builds/Web/index.apple-touch-icon.png�����;   res://Builds/Web/index.icon.pngD+���!s   res://Builds/Web/index.png��#�}�   res://ball.tscn�����s   res://icon.svg*��h�"3   res://main.tscn!��x �!-   res://noismat.tres^dW�_4K   res://noismatbw.tres������F]   res://ARmain.tscn*��h�"3   res://VRmain.tscn  ECFG	      application/config/name      
   WEBXR Demo     application/config/description�      �   
<script src="https://cdn.jsdelivr.net/npm/webxr-layers-polyfill@latest/build/webxr-layers-polyfill.min.js"></script>
<script>
var layersPolyfill = new WebXRLayersPolyfill();
</script>	      application/run/main_scene         res://ARmain.tscn      application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility4   rendering/textures/vram_compression/import_etc2_astc            xr/shaders/enabled                 