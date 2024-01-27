import { createRequire } from 'node:module'

import { getConfig } from '@jeromefitz/semantic'

import isCI from 'is-ci'

if (!isCI) {
  const dotenv = await import('dotenv')
  dotenv.config({ path: './.env' })
}

const require = createRequire(import.meta.url)
const pkg = require('./package.json')

const { name } = pkg

const branches = [{ name: 'main' }, { name: 'develop', prerelease: 'develop' }]

const configPassed = {
  branches,
  contributorsProhibitList: {
    email: [],
    login: ['BotJerome', 'JeromeFitz'],
  },
  enableNpm: false,
  repositoryUrl: `https://github.com/${name.replace('@', '')}`,
  tagFormat: 'v${version}',
}

const config = getConfig(configPassed)

export default config
