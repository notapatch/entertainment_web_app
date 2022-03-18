const defaultTheme = require("tailwindcss/defaultTheme")

module.exports = {
  content: [
    './app/components/**/*',
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/images/**/*.svg',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      backgroundColor: {
        skin: {
          background:       'var(--color-background)',
          surface:          'var(--color-surface)',
          primary:          'var(--color-primary)',
          'primary-hover':  'var(--color-primary-hover)',
        }
      },
      borderColor: {
        skin: {
          'surface-text':           'var(--color-surface-text)',
          'surface-text-secondary': 'var(--color-surface-text-secondary)',
        }
      },
      caretColor: {
        skin: {
         'primary':         'var(--color-primary)',
        }
      },
      maxWidth: {
       '100': '25rem',
      },
      textColor: {
        skin: {
          'background-text':           'var(--color-background-text)',
          'background-text-muted':     'var(--color-background-text-muted)',
          'background-text-secondary': 'var(--color-background-text-secondary)',
          'background-text-error':     'var(--color-background-text-error)',

          'surface-text':              'var(--color-surface-text)',
          'surface-text-error':        'var(--color-primary)',
          'surface-text-muted':        'var(--color-surface-text-muted)',
          'surface-text-secondary':    'var(--color-surface-text-secondary)',

          'primary':                   'var(--color-primary)',
          'primary-text':              'var(--color-primary-text)',
          'primary-text-hover':        'var(--color-primary-text-hover)',
        }
      }
    },
    fontFamily: {
      sans: ['Outfit', ...defaultTheme.fontFamily.sans]
    },
    fontSize: {
      '3xs': ['11px'],
      '2xs': ['12px'],
      xs:    ['13px'],
      sm:    ['14px'],
      base:  ['15px'],
      lg:    ['18px'],
      xl:    ['20px'],
      '2xl': ['24px'],
      '3xl': ['32px'],
    }
  }
}
