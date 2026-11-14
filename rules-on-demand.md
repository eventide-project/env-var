# A version is semver, optionally prefixed by a product generation number

Source: system/versioning/source/a-version-is-semver-optionally-prefixed-by-a-product-generation-number.md

Trigger: When choosing, writing, or proposing a package version or cutting a release

1. A version takes one of two forms:

```
<major>.<minor>.<patch>              2.3.1
<generation>.<major>.<minor>.<patch> 2.2.3.1
```

2. The three trailing segments are semantic versioning.
3. The leading segment, when present, is the product generation.
4. Choose the semver segment to increase by what a user of the package must do.
5. Do not choose it by the change's size, duration, or how much source it touched.
6. Increase patch when behavior is corrected and the interface is unchanged. The user upgrades without reading or touching code.
7. Increase minor when a capability is added and everything using the previous version still works.
8. With a minor, the user changes no code and reads only to use the new capability.
9. Increase major when something a user may rely on is gone or different. The user reads first and may change code.
10. A rewrite that leaves every interface intact is a patch.
11. A single removed method is a major.
12. The generation is a declaration, not a compatibility claim. It answers whether this is the same product.
13. The generation is increased only when an entirely new product line is declared.
14. Declaring a new product line is a product management decision, not a technological one. Whoever decides what the product line is decides it.
15. Never increase the generation as part of a release. Declaring a new product line is a separate act, done for its own reasons on its own occasion.
16. A release after a declared new product line carries the new generation because the line was already declared.
17. A project uses one form throughout its life.
18. A project that carries a generation carries it in every version.
19. A project without a generation never acquires one at a release.

# The next version is put to the engineer, never decided by the agent

Source: system/versioning/source/the-next-version-is-put-to-the-engineer-never-decided-by-the-agent.md

Trigger: When cutting a release or determining the next version of a package

1. At a release, the agent does not select the next version.
2. The agent presents the candidates through the **AskUserQuestion** selection UI.
3. Present one option per segment that could be increased.
4. Each option shows the version that would result.
5. The engineer chooses.
6. For a package at `2.2.3.1`, the options are:

```
Patch  → 2.2.3.2   behavior corrected, interface unchanged
Minor  → 2.2.4.0   capability added, existing use unaffected
Major  → 2.3.0.0   existing use may not survive
```

7. At a release, read the current version first.
8. Offer patch, minor, and major as the options.
9. The generation is not among the candidates. It is not a release-time decision. See the a-version-is-semver-optionally-prefixed-by-a-product-generation-number rule.
10. Each option states the compatibility claim it makes, not only the number.
11. The resulting version is shown too, since it is what will be written and committed.
12. Offer candidates rather than asking the engineer for a version outright.
13. Do not propose a version and ask for confirmation. The decision is put at a gate.
