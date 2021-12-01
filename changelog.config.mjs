import config from '@jeromefitz/git-cz/dist/themes/gitmoji'
import isCI from 'is-ci'
!isCI && require('dotenv').config({ path: './.env' })

const enabled = process.env.GIT_CZ || true

const changelog = { ...config, enabled }

export default changelog
