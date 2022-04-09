using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// درصد ثابت جایزه
/// </summary>
public class RewardPercent
{
	public RewardPercent()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //public enum Percent
    //{
    //        RewardForFirstWin   = 0.50f,
    //        RewardForSecondWin  = 0.30f,
    //        rewardForGovernment = 0.05f,
    //        rewardForCharitable = 0.05f,
    //        rewardForSite       = 0.10f
    //}
    private float _rewardForFirstWin   = 0.50f;
    private float _rewardForSecondWin  = 0.30f;
    private float _rewardForGovernment = 0.05f;
    private float _rewardForCharitable = 0.05f;
    private float _rewardForSite       = 0.10f;

    public float RewardForFirstWin
    {
        get { return _rewardForFirstWin; }
        set { _rewardForFirstWin = value; }
    }    
    public float RewardForSecondWin
    {
        get { return _rewardForSecondWin; }
        set { _rewardForSecondWin = value; }
    }
    public float RewardForGovernment
    {
        get { return _rewardForGovernment; }
        set { _rewardForGovernment = value; }
    }
    public float RewardForCharitable
    {
        get { return _rewardForCharitable; }
        set { _rewardForCharitable = value; }
    }
    public float RewardForSite
    {
        get { return _rewardForSite; }
        set { _rewardForSite = value; }
    }
}