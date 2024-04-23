import { configBase as eslintBase } from '@jeromefitz/eslint-config/base.js'
import { configTypescript as eslintTypescript } from '@jeromefitz/eslint-config/typescript.js'

/** @type {import('typescript-eslint').Config} */
const config = [...eslintBase, ...eslintTypescript]
export default config
