project ('virgil-demo', [ 'vala', 'c' ], version: '1.0')

# Variables
source_dir  = meson.current_source_dir ()

vala_lint = find_program ('io.elementary.vala-lint', required : false)
if vala_lint.found ()
    test ('Vala lint', vala_lint, args: [ '-d', source_dir ])
endif

virgil = subproject ('virgil-devel')

subdir ('src')

executable (
    meson.project_name (),

    project_sources,

    dependencies: [
        virgil.get_variable ('virgil_dep'),
        meson.get_compiler('c').find_library('m')
    ]
)
