import { getConfig } from '@jeromefitz/semantic'

import isCI from 'is-ci'

if (!isCI) {
  const dotenv = await import('dotenv')
  dotenv.config({ path: './.env' })
}

const branches = [{ name: 'main' }, { name: 'develop', prerelease: 'develop' }]

const _config = {
  branches,
  contributorsProhibitList: {
    email: [],
    login: ['BotJerome', 'JeromeFitz'],
  },
  enableNpm: false,
  repositoryUrl: `https://github.com/JeromeFitz/dotfiles`,
  tagFormat: 'v${version}',
}

const config = getConfig(_config)

export default config
