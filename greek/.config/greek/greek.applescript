on theSplit(theString, theDelimiter)
	-- save delimiters to restore old settings
	set oldDelimiters to AppleScript's text item delimiters
	-- set delimiters to delimiter to be used
	set AppleScript's text item delimiters to theDelimiter
	-- create the array
	set theArray to every text item of theString
	-- restore the old setting
	set AppleScript's text item delimiters to oldDelimiters
	-- return the result
	return theArray
end theSplit

set greekLetters to {"Alpha (Α)", "alpha (α)", "Beta (Β)", "beta (β)", "Chi (Χ)", "chi (χ)", "Delta (Δ)", "delta (δ)", "Epsilon (Ε)", "epsilon (ε)", "Eta (Η)", "eta (η)", "Gamma (Γ)", "gamma (γ)", "Iota (Ι)", "iota (ι)", "Kappa (Κ)", "kappa (κ)", "Lambda (Λ)", "lambda (λ)", "Mu (Μ)", "mu (μ)", "Nu (Ν)", "nu (ν)", "Omega (Ω)", "omega (ω)", "Omicron (Ο)", "omicron (ο)", "Phi (Φ)", "phi (φ)", "Pi (Π)", "pi (π)", "Psi (Ψ)", "psi (ψ)", "Rho (Ρ)", "rho (ρ)", "Sigma (Σ)", "sigma (σ)", "Tau (Τ)", "tau (τ)", "Theta (Θ)", "theta (θ)", "Upsilon (Υ)", "upsilon (υ)", "Xi (Ξ)", "xi (ξ)", "Zeta (Ζ)", "zeta (ζ)"}

tell application "System Events"
	activate
	set letter to item 1 of (choose from list greekLetters)
end tell
set letter to item 2 of theSplit(letter, " ")
set letter to do shell script "sed 's/(// ; s/)//' <<<" & quoted form of letter

set the clipboard to letter

