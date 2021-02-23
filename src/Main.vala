using Virgil;
using Virgil.Graphics;

namespace Demo {
    public class DemoGame : Game {
        private Texture2D _texture;
        private GameState _state;

        public override void start () {
            _state = Game.get_state ();
            _texture = new Texture2D.from_file ("/.VolumeIcon.png");

            _state.window.title = "Virgil-Demo";
        }

        public override void draw () {
            _state.renderer.sdl_renderer.copy (
                _texture.sdl_texture, null, null
            );
        }
    }
}

public static int main (string[] args) {
    Demo.DemoGame game = new Demo.DemoGame ();

    return game.run ();
}