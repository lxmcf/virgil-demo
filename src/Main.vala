using Virgil.Graphics;
using Virgil.Debug;
using Virgil.Input;

namespace Virgil {
    public class Demo : Game {
        private StaticTexture2D _texture;
        private TextureRaw _texture_raw;

        private GameState _state;

        public override void start () {
            _state = Game.get_state ();

            _texture_raw = new TextureRaw (640, 360);

            refresh_texture ();

            _texture = new StaticTexture2D.from_texture_raw (_texture_raw);

            _state.window.title = "Virgil - Demo";
        }

        public override void update () {
            if (Keyboard.check_key_released ("Escape")) {
                quit ();
            }

            if (Keyboard.check_key_released ("Space")) {
                Virgil.Math.Perlin.randomise ();

                refresh_texture ();

                _texture.set_pixels (_texture_raw.get_pixels ());
            }
        }

        public override void draw () {
            int sprite_width, sprite_height;

            _texture.get_size (out sprite_width, out sprite_height);
            Point point = new Point ((_state.window.width / 2) - (sprite_width / 2), (_state.window.height / 2) - (sprite_height / 2));

            _state.renderer.render_texture_point (_texture, point);
        }

        public void refresh_texture () {
            for (int y = 0; y < _texture_raw.height; y++) {
                for (int x = 0; x < _texture_raw.width; x++) {
                    double perlin = Virgil.Math.Perlin.get_noise_2D (x, y, 0.01, 10);

                    if (perlin < 0.5) {
                        _texture_raw.set_pixel (x, y, 68, 64, 119, 255);
                    } else {
                         if (perlin > 0.5 && perlin < 0.51) {
                            _texture_raw.set_pixel (x, y, 206, 187, 142, 255);
                         } else {
                             if (perlin > 0.8) {
                                _texture_raw.set_pixel (x, y, 230, 230, 230, 255);
                             } else {
                                _texture_raw.set_pixel (x, y, 79, 135, 87, 255);
                            }
                        }
                    }
                }
            }
        }
    }
}

public static int main (string[] args) {
    Virgil.Demo game = new Virgil.Demo ();

    return game.run ();
}
