from omni.isaac.kit import SimulationApp

CONFIG = {
    "headless": True,
    "renderer": "RayTracedLighting",
}

simulation_app = SimulationApp(CONFIG)

try:
    import carb
    from omni.isaac.core import World
    from omni.isaac.core.utils.stage import create_new_stage

    create_new_stage()
    world = World()

    for _ in range(5):
        world.step(render=False)

    carb.log_info("ISAAC_SMOKETEST_OK")
    print("ISAAC_SMOKETEST_OK")
finally:
    simulation_app.close()
