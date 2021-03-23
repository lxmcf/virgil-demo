using Virgil.Graphics;
using Virgil.Debug;
using Virgil.Input;

namespace Virgil {
    public class Demo : Game {
        private StaticTexture2D _texture;
        private GameState _state;

        public override void start () {
            _state = Game.get_state ();

            _texture = new StaticTexture2D.from_file ("/.VolumeIcon.png");

            TextureRaw text = new TextureRaw (32, 32);

            _state.window.title = "Virgil-Demo";
        }

        public override void update () {
            if (Keyboard.check_key_released (SDL.Input.Keycode.ESCAPE)) { quit (); }
        }

        public override void draw () {
            _state.renderer.render_texture (_texture, 0, 0);
        }
    }
}

public static int main (string[] args) {
    Virgil.Demo game = new Virgil.Demo ();

    return game.run ();
}
