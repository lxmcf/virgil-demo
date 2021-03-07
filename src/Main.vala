using Virgil;
using Virgil.Graphics;
using Virgil.Debug;

namespace Demo {
    public class DemoGame : Game {
        private DynamicTexture2D _texture;
        private GameState _state;

        public override void start () {
            _state = Game.get_state ();

            int width, height, channels, pitch;
            void* pixels = Stbi.load ("/.VolumeIcon.png", out width, out height, out channels);
            void* new_pixels;

            _texture = new DynamicTexture2D (width, height);
            _texture.lock (_texture.get_bounds (), out new_pixels, out pitch);

            Memory.copy (new_pixels, pixels, height * pitch);

            _texture.unlock ();

            _state.window.title = "Virgil-Demo";
        }

        public override void draw () {
            _state.renderer.render_texture (_texture, 0, 0);
        }
    }
}

public static int main (string[] args) {
    Demo.DemoGame game = new Demo.DemoGame ();

    return game.run ();
}
