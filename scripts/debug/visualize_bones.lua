local is_enabled = false

function onGUI()
	local changed
	changed, is_enabled = ImGui.Checkbox("Visualize", is_enabled)
	
	if is_enabled then
		local renderable = Renderer.getRenderableComponent(g_scene_renderer, this)
		local model = Renderer.getRenderableModel(g_scene_renderer, renderable)
		local bone_count = Model.getBoneCount(model)
		for i = 0, bone_count-1 do
			local pos = Model.getBonePosition(model, i)
			local parent_idx = Model.getBoneParent(model, i)
			if parent_idx >= 0 then
				local parent_pos = Model.getBonePosition(model, parent_idx)
				Renderer.addDebugLine(g_scene_renderer, pos, parent_pos, 0xffff00FF, 0)
			end
		end
	end
end