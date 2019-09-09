package kr.or.ddit.announce.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.alarm.dao.IAlarmDAO;
import kr.or.ddit.announce.dao.IAnnounceDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AnnouncePagingVO;
import kr.or.ddit.vo.AnnounceVO;
import kr.or.ddit.vo.ApplicantMemberVO;
import kr.or.ddit.vo.LicenseVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class AnnounceServiceImpl implements IAnnounceService {
	
	@Inject
	IAnnounceDAO dao;
	@Inject
	IAlarmDAO alDao;
	
	@Override
	public long retrieveAnnounceCount(AnnouncePagingVO announcePagingVO) {
		return dao.selectAnnounceCount(announcePagingVO);
	}

	@Override
	public long selectAnnounceCountForMy(AnnouncePagingVO announcePagingVO) {
		return dao.selectAnnounceCountForMy(announcePagingVO);
	}

	@Override
	public List<AnnounceVO> retrieveAnnounceList(AnnouncePagingVO announcePagingVO) {
		return dao.selectAnnounceList(announcePagingVO);
	}
	
	@Override
	public List<AnnounceVO> retrieveAnnounceListForApp(AnnouncePagingVO announcePagingVO) {
		return dao.selectAnnounceListForApp(announcePagingVO);
	}

	@Override
	public long selectApplicantCount(PagingVO pagingVO) {
		return dao.selectApplicantCount(pagingVO);
	}

	@Override
	public List<ApplicantMemberVO> selectApplicantMemberList(PagingVO pagingVO) {
		return dao.selectApplicantMemberList(pagingVO);
	}

	@Override
	public List<AnnounceVO> selectAnnounceListForMy(AnnouncePagingVO announcePagingVO) {
		return dao.selectAnnounceListForMy(announcePagingVO);
	}

	@Override
	public AnnounceVO retrieveAnnounce(Integer annl_no) {
		return dao.selectAnnounce(annl_no);
	}
	
	@Transactional
	@Override
	public ServiceResult createAnnounce(AnnounceVO announceVO) {
		int cnt = dao.insertAnnounce(announceVO);
		boolean flag = true;
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			processLicence(announceVO, flag);
			result = ServiceResult.OK;
		}
		return result;
	}

	private void processLicence(AnnounceVO announceVO, boolean flag) {
		if(flag) {
			if(announceVO.getLicenseList() == null || announceVO.getLicenseList().isEmpty()) return;
				
			List<LicenseVO> licenseList = announceVO.getLicenseList();
			for(LicenseVO licenseVO : licenseList) {
				licenseVO.setAnnl_no(announceVO.getAnnl_no());
				dao.insertLicense(licenseVO);
			}
		} else {
			AnnounceVO savedAnnounce = dao.selectAnnounce(announceVO.getAnnl_no());
			List<LicenseVO> insertLicense = announceVO.getLicenseList();
			if(insertLicense != null) {
				outer : for(int i = insertLicense.size(); i >= 0; i--) {
					LicenseVO checkLicense = insertLicense.get(i);
					for(LicenseVO savedLicense : savedAnnounce.getLicenseList()) {
							for(LicenseVO deleteLicese : announceVO.getLicenseList()) {
								if(checkLicense.equals(deleteLicese) || checkLicense.equals(savedLicense)) {
									insertLicense.remove(checkLicense);
									continue outer;
							}
						}
					}
				}
			}
			
			List<LicenseVO> deleteLicense = new ArrayList<LicenseVO>();
			if(savedAnnounce.getLicenseDelete() != null) {
				for(LicenseVO licenseVO : savedAnnounce.getLicenseDelete()) {
					for(LicenseVO deleteLicenseVO : announceVO.getLicenseDelete()) {
						if(licenseVO.equals(deleteLicenseVO)) {
							deleteLicense.add(licenseVO);
							break;
						}
					}
				}
			}
			if(insertLicense != null) {
				for(LicenseVO licenseVO : insertLicense) {
					dao.insertLicense(licenseVO);
				}
			}
			if(!deleteLicense.isEmpty()) {
				for(LicenseVO licenseVO : deleteLicense) {
					dao.deleteLicense(licenseVO);
				}
			}
			
		}
		
		
	}

	@Override
	public ServiceResult modifyAnnounce(AnnounceVO announceVO) {
		int cnt = dao.updateAnnounce(announceVO);
		boolean flag = false;
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
//			processLicence(announceVO, flag);
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult romoveAnnounce(Integer annl_no) {
		int cnt = dao.deleteAnnounce(annl_no);
		ServiceResult result = ServiceResult.FAILED;
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	@Transactional
	public ServiceResult createApplicant(Map<String, String> applicant) {
		int num = dao.selectApplicant(applicant);
		ServiceResult result = ServiceResult.FAILED;
		if(num>=1) { 
			result = ServiceResult.PKDUPLICATED;
		} else {
			 int num2 = dao.insertApplicant(applicant);
			 if(num2 == 1) {
				 result = ServiceResult.OK;
			 }
		}
		return result;
	}

	@Override
	public long retrieveScrapCount(AnnouncePagingVO announcePagingVO) {
		return dao.selectScrapCount(announcePagingVO);
	}

	@Override
	public List<AnnounceVO> retrieveScrapList(AnnouncePagingVO announcePagingVO) {
		return dao.selectScrapList(announcePagingVO);
	}

	@Override
	public int appCount(String mem_id) {
		return dao.appCount(mem_id);
	}

	@Override
	public int selectScrap(Map<String, String> scrap) {
		return dao.selectScrap(scrap);
	}

	@Override
	public int inserteScrap(Map<String, String> scrap) {
		return dao.inserteScrap(scrap);
	}

	@Override
	public int deleteScrap(Map<String, String> scrap) {
		return dao.deleteScrap(scrap);
	}

	@Override
	public int countScrap(String mem_id) {
		return dao.countScrap(mem_id);
	}

	@Override
	public long selectSuccCount(PagingVO pagingVO) {
		return dao.selectSuccCount(pagingVO);
	}

	@Override
	public List<ApplicantMemberVO> selectSuccMemebrtList(PagingVO pagingVO) {
		return dao.selectSuccMemebrtList(pagingVO);
	}

	@Override
	@Transactional
	public void insertSucc(Map<String, String> succ) {
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setAnnl_no(Integer.parseInt(succ.get("annl_no")));
		alarmVO.setMem_id1(succ.get("mem_id"));
		alDao.succNotice(alarmVO);
		dao.updateSuccAnnounce(Integer.parseInt(succ.get("annl_no")));
		dao.insertSucc(succ);
	}

	@Override
	@Transactional
	public int selectAnnounceCountForMyOnGoing(String mem_id) {
		int result = dao.selectAnnounceCountForMyOnGoing1(mem_id) + dao.selectAnnounceCountForMyOnGoing2(mem_id);
		return result;
	}

	@Override
	@Transactional
	public int selectAnnounceCountForEnd(String mem_id) {
		int result = dao.selectAnnounceCountForEnd1(mem_id) + dao.selectAnnounceCountForEnd2(mem_id);
		return result;
	}

	
	
	@Override
	public List<AnnounceVO> mainAccountList() {
		return dao.mainAccountList();
	}

	@Override
	public List<String> selectRecList(Integer annl_no) {
		return dao.selectRecList(annl_no);
	}
	

}
