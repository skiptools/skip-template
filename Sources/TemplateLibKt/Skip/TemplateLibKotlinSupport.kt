// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

// This Kotlin source file will be included in the transpiled package.
// This can be used to provide custom Kotlin that can be accessed
// from Swift using #if SKIP directives.
package template.lib
import skip.foundation.*

fun templateLibHelloSkip(): String {
	return "Hello Swift. I am Kotlin. Pleased to meet you!"
}
