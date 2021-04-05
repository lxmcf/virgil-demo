project ('virgil-demo', [ 'vala', 'c' ], version: '1.0')

# Variables
source_dir  = meson.current_source_dir ()
use_subproject = get_option ('use-subproject')

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')

vala_lint = find_program ('io.elementary.vala-lint', required : false)
if vala_lint.found ()
    test ('Vala lint', vala_lint, args: [ '-d', source_dir ])
endif

if use_subproject
    virgil = subproject ('virgil')
    demo_dependencies = [ virgil.get_variable ('libvirgil_dep') ]
else
    demo_dependencies = [ dependency ('virgil') ]
endif

subdir ('src')

demo_virgil = executable (
    meson.project_name (),

    project_sources,

    dependencies: demo_dependencies,

    install: true
)
