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

            //  uchar[] _pixels = new uchar [12];
            //  for (int i = 0; i < 12; i++) {
            //      if ((i + 1) % 4 == 0) {
            //          _pixels[i] = 0;

            //          print_message (i.to_string ());
            //      } else {
            //          _pixels[i] = 255;
            //      }
            //  }

            //  _texture.set_pixels (_pixels);

            //  _state.window.title = "Virgil-Demo";
        }

        public override void update () {
            if (Keyboard.check_key_released ("Escape")) { quit (); }
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
